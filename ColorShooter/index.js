let canvas = document.querySelector("canvas");
canvas.width = innerWidth
canvas.height = innerHeight
var c = canvas.getContext('2d')
var score=document.querySelector(".score")
var over=document.querySelector(".over")
var n=0,k=0
var time=1000
 class Player{
    constructor(x,y,radius,color){
      this.x=x
      this.y=y
      this.radius=radius
      this.color=color
    }
    draw(){
        c.beginPath()
        c.arc(this.x,this.y,this.radius,0,Math.PI*2,false)
        c.fillStyle=this.color
        c.fill()  
    }
 }
 function Distance(x1,y1,x2,y2) {
    var xd=x2-x1;
    var yd=y2-y1;

    return Math.sqrt(Math.pow(xd,2)+Math.pow(yd,2));
    
}
 class Projectile{
    constructor(x,y,radius,color,velocity){
        this.x=x
        this.y=y
        this.radius=radius
        this.velocity=velocity
        this.color=color
      }
      draw(){
        c.beginPath()
        c.arc(this.x,this.y,this.radius,0,Math.PI*2,false)
        c.fillStyle=this.color
        c.fill()   
    }
    
    update(){
        
        this.draw()
        this.x+=this.velocity.x
        this.y+=this.velocity.y
    }
 }
 class Enemies{
    constructor(x,y,radius,color,velocity){
        this.x=x
        this.y=y
        this.radius=radius
        this.velocity=velocity
        this.color=color
      }
      draw(){
        c.beginPath()
        c.arc(this.x,this.y,this.radius,0,Math.PI*2,false)
        c.fillStyle=this.color
        c.fill()   
    }
    
    update(){
        
        this.draw()
        this.x+=this.velocity.x
        this.y+=this.velocity.y
    }
 }
 const friction=0.97
 class Particle{
    constructor(x,y,radius,color,velocity){
        this.x=x
        this.y=y
        this.radius=radius
        this.velocity=velocity
        this.color=color
        this.alpha=1
      }
      draw(){
        c.save()
        c.globalAlpha=this.alpha
        c.beginPath()
        c.arc(this.x,this.y,this.radius,0,Math.PI*2,false)
        c.fillStyle=this.color
        c.fill()
        c.restore()   
    }
    
    update(){
        
        this.draw()
        this.velocity.x*=friction
        this.velocity.y*=friction
        this.x+=this.velocity.x
        this.y+=this.velocity.y
        this.alpha-=0.01
    }
 }
 const enemies=[]
 function spawnEnemies() {
    setInterval(()=>{
        let x=Math.random()*canvas.width
        let y=Math.random()*canvas.height
        let color=`hsl(${Math.random()*360},50%,50%)`
        let radius=Math.random()*(30-4)+4
        const angle=Math.atan2(canvas.height/2-y,canvas.width/2-x)
        const velocity={
            x:Math.cos(angle),
            y:Math.sin(angle)
        }
        if(Distance(canvas.width/2,canvas.height/2,x,y)<200){
            
        }
        else{
        enemies.push(new Enemies(x,y,radius,color,velocity))}
    
    },time)  
 }

 const x=canvas.width/2
 const y=canvas.height/2
 const player=new Player(x,y,10,'white');
const projectiles=[]
const particles=[]
window.addEventListener('click',(event)=>{
    const angle=Math.atan2(event.clientY-canvas.height/2,event.clientX-canvas.width/2)
    const velocity={
        x:Math.cos(angle)*5,
        y:Math.sin(angle)*5
    }
    projectiles.push(new Projectile(canvas.width/2,canvas.height/2,5,'white',velocity))
})
window.addEventListener('touchStart',(event)=>{
    const angle=Math.atan2(event.touches[0].clientY-canvas.height/2,event.touches[0].clientX-canvas.width/2)
    const velocity={
        x:Math.cos(angle)*5,
        y:Math.sin(angle)*5
    }
    projectiles.push(new Projectile(canvas.width/2,canvas.height/2,5,'white',velocity))
})
let animation
 function animate() {
   
    animation=requestAnimationFrame(animate)
    c.fillStyle='rgba(0,0,0,0.1)'
    c.fillRect(0,0,canvas.width,canvas.height)
    player.draw();
    particles.forEach((element,index)=>{
        if(element.alpha<=0){
            particles.splice(index,1)
        }
        else{
            element.update()
        }
        
    })
    projectiles.forEach((element,index) => {
        element.update()
        if(element.x+element.radius<0||element.y+element.radius<0||element.y-element.radius>canvas.height
            ||element.x-element.radius>canvas.width){
            setTimeout(() => {
                projectiles.splice(index,1)
            }, 0);
        }
    })
    enemies.forEach((enemy,index)=> {
        enemy.update()
        const dist=Distance(player.x,player.y,enemy.x,enemy.y)
        if(dist-player.radius-enemy.radius<0){
            cancelAnimationFrame(animation)
            over.style.display='flex'
            document.querySelector(".zero").innerHTML=`${n}`
            document.querySelector(".btn").innerHTML="Restart"
            k=1
         
            
        }
        projectiles.forEach((projectile,pIndex) => {
            const dis=Distance(projectile.x,projectile.y,enemy.x,enemy.y)
            if(dis-enemy.radius-projectile.radius<0){
                 for (let i = 0; i < enemy.radius*2; i++) {
                    particles.push(new Particle(projectile.x,projectile.y,Math.random()*2,enemy.color,{
                        x:(Math.random()-0.5)*(Math.random()*6),
                        y:(Math.random()-0.5)*(Math.random()*6)
                    }))
                    
                 }
                if(enemy.radius-10>10){
                    gsap.to(enemy,{
                     radius:enemy.radius-10
                    })
                    projectiles.splice(pIndex,1)
                    n+=100
                    score.innerHTML=n
                }
                else{
                    setTimeout(() => {
                        n+=150
                    score.innerHTML=n
                        projectiles.splice(pIndex,1)
                    enemies.splice(index,1)
                    }, 0);
                    
                }
                if(n>5000){
                    time=700
                }
                else if(n>10000){
                    time=500
                }
                else if(n>20000){
                    time=400
                }
                
            }
        });
    })
    
 }
 
 document.querySelector(".btn").addEventListener("click",()=>{
    
        spawnEnemies()
        animate()
        over.style.display='none'
        if(k==1){
            k=0
            window.location.reload()
             
        }
    
  
    
 })
