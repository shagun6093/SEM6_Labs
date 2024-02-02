class Bicycle {
  gear: number;
  speed: number;

  constructor(gear: number, speed: number) {
    this.gear = gear;
    this.speed = speed;
  }

  applyBrake(decrement: number): void {
    this.speed -= decrement;
    console.log(`Applying brake. Speed decreased to ${this.speed}`);
  }

  speedUp(increment: number): void {
    this.speed += increment;
    console.log(`Speeding up. Speed increased to ${this.speed}`);
  }

  toString(): string {
    return `Gear: ${this.gear}, Speed: ${this.speed}`;
  }
}

class MountainBike extends Bicycle {
  suspension: string;

  constructor(gear: number, speed: number, suspension: string) {
    super(gear, speed);
    this.suspension = suspension;
  }

  toString(): string {
    return `${super.toString()}, Suspension: ${this.suspension}`;
  }
}


const myBike = new MountainBike(3, 20, 'Front Suspension');
console.log(myBike.toString()); 

myBike.speedUp(10); 
myBike.applyBrake(5); 
console.log(myBike.toString()); 
