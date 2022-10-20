# flutter_intership

# Task
  Build a flutter app with very basic UI and the following features:
1.	Authentication (Signup and Sign-in with email): There are 2 types of users, seller and customer. Email of the user should be verified (firebase offers this functionality inbuilt). Upon successful verification of email, you should create a Firestore document in the collection of sellers or customers, whatever is the type of user. Fields to be stored for customer: Name, city, zip code, age (let him enter dob, but you should store his/her age), Gender, email and for seller: Name, Business Name, category (Electronics, consumer durables, etc), city, email, phone 
2.	Sellers should get an option to add a new product. In the post product form, take the following parameters: Brand, Category (dropdown), Name, Price (Number).
3.	Home Screen: Customers in his home screen should see all products, sellers in his home screen should see only the products posted by him.
4.	The customer should be able to apply price filters on products. Note: These filters should be implemented using firestore queries, not handled on the frontend
* How to know if the user is registering as a seller or customer?
-> Use a dropdown at the time of signup/sign-in and store it in local storage throughout. This local memory should persist, unless exclusively cleared by the user or the app is uninstalled

# Application Ui
<div style="display:flex,flex-direction:row">
<img src="https://user-images.githubusercontent.com/94373786/187464860-88276a9d-1162-4838-a44e-96ee5957655c.jpeg" width="300" height="300">
<img src="https://user-images.githubusercontent.com/94373786/187464928-631c66be-1442-467d-a59b-bb5415271ff6.jpeg" width="300" height="300">
<img src="https://user-images.githubusercontent.com/94373786/187464977-0d57cad1-571a-414c-a6cf-cd573fe3ac2d.jpeg" width="300" height="300">
<img src="https://user-images.githubusercontent.com/94373786/187492093-afcb4523-1a6e-4522-bb30-1b29640ff608.jpeg" width="300" height="300">
<img src="https://user-images.githubusercontent.com/94373786/187479648-cb00ac55-9dbf-4037-85f8-2950ccb60860.jpeg" width="300" height="300">
<img src="https://user-images.githubusercontent.com/94373786/187465037-29168296-02cc-4924-9605-17156d6ec34a.jpeg" width="300" height="300">
<img src="https://user-images.githubusercontent.com/94373786/187465168-51aee3bd-c339-4cac-bf66-6ff4c4d5f40a.jpeg" width="300" height="300">
<img src="https://user-images.githubusercontent.com/94373786/187465236-6f575eee-c7c6-413e-b7c7-04dfec995023.jpeg" width="300" height="300">
<img src="https://user-images.githubusercontent.com/94373786/187493610-76169e3f-6fdc-4bcd-bdb0-b9be1f55f23b.jpeg" width="300" height="300">
<img src="https://user-images.githubusercontent.com/94373786/187465387-5ab02fbf-8dfc-400c-9979-fac0f8dacf1b.jpeg" width="300" height="300">
<img src="https://user-images.githubusercontent.com/94373786/187465428-9332f933-968b-426e-8a9d-026eb430a599.jpeg" width="300" height="300">
<img src="https://user-images.githubusercontent.com/94373786/187479363-eff2efa2-1573-4b2c-9adf-0292268b679f.jpeg" width="300" height="300">
<img src="https://user-images.githubusercontent.com/94373786/187479439-924aa35e-45c4-4903-8296-613ad276ab69.jpeg" width="300" height="300">
<img src="https://user-images.githubusercontent.com/94373786/187494087-777000d7-68d7-48d7-8dc9-e4bcde9f5270.jpeg" width="300" height="300">

</div>


A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
