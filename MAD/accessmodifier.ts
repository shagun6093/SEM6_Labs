// class Employee {
//     public empCode: string;
//     empName: string;
// }

// let emp = new Employee();
// emp.empCode = "123";
// emp.empName = "Swati";

// console.log(emp.empCode);
// console.log(emp.empName);


// class Employee {
//     private empCode: number;
//     empName: string;
// }

// let emp = new Employee();
// emp.empCode = 123; // Compiler Error
// emp.empName = "Swati";//OK


// class Employee {
//     public empName: string;
//     protected empCode: number;

//     constructor(name: string, code: number){
//         this.empName = name;
//         this.empCode = code;
//     }
// }

// class SalesEmployee extends Employee{
//     private department: string;
    
//     constructor(name: string, code: number, department: string) {
//         super(name, code);
//         this.department = department;
//     }
// }

// let emp = new SalesEmployee("John Smith", 123, "Sales");
// emp.empCode; //Compiler Error
