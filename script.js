const
  range = document.getElementById('range'),
  rangeV = document.getElementById('rangeV'),
  weight = document.getElementById('weight'),
  setValue = ()=>{
    const
      newValue = Number( (range.value - range.min) * 100 / (range.max - range.min) ),
      newPosition = 10 - (newValue * 0.2);
    rangeV.innerHTML = `<span>${range.value}</span>`;
    weight.placeholder=range.value;
    weight.value = range.value;
    rangeV.style.left = `calc(${newValue}% + (${newPosition}px))`;
  };
document.addEventListener("DOMContentLoaded", setValue);
range.addEventListener('input', setValue);

const
  rangeVH =document.getElementById('rangeVH'),
  rangeH = document.getElementById('rangeH'),
  height = document.getElementById('height'),
  setValueH=()=> {
    const
        newValueH = Number((rangeH.value - rangeH.min) * 100 / (rangeH.max - rangeH.min)), newPositionH = 10 - (newValueH * 0.2);
    rangeVH.innerHTML = `<span>${rangeH.value}</span>`;
    height.placeholder = rangeH.value;
    height.value = rangeH.value;
    rangeVH.style.left = `calc(${newValueH}% + (${newPositionH}px))`;
}
document.addEventListener("DOMContentLoaded", setValueH);
rangeH.addEventListener('input', setValueH);
var calculateButton = document.querySelector(".calculate");
var result = document.querySelector(".result");
var statement = document.querySelector(".result-statement");
var BMI, hht, wht;

calculateButton.addEventListener("click", ()=>{

    hht = height.value;
    wht = weight.value;
    BMI = (wht*100*100)/(hht**2); 
    result.innerText += BMI.toPrecision(5);

    if(BMI < 18.5){
        statement.innerText = `Your BMI is falls within the underweight range`;    
    }else if((BMI > 18.5) && (BMI < 24.9)){
        statement.innerText = `Your BMI falls within the normal or healthy weight range`;
    }else if((BMI > 25) && (BMI < 29.9 )){
        statement.innerText = `Your BMI falls within the overweight range`;
    }else{
        statement.innerText = `Your BMI falls within the obese range`;
    }
});