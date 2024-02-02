// array
let myList1=[1,2,3]
let myList2:number[]=[1,2,3]
let myList3:Array<number>=[1,2,3]
let myList4=new Array(4)
console.log(myList1);
console.log(myList2);
console.log(myList3);
console.log(myList4);

// tuple
let x=["Hello",10];
var[a,b] =x
console.log(a)
console.log(b)


//union
var z:string|number
z=12
console.log("numeric value of val : "+z)
z="This is a string"
console.log("String value of val : "+z)

