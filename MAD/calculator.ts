type Operator = 'add' | 'subtract' | 'multiply' | 'divide';

const getUserInput = (message: string): number => {
    const input = prompt(message);
    if (input === null) {
        throw new Error('User canceled the input.');
    }
    return parseFloat(input);
};

const getOperation = (): Operator => {
    const input = prompt('Enter operation (add, subtract, multiply, divide):');
    if (input === null) {
        throw new Error('User canceled the input.');
    }
    const operator = input.toLowerCase() as Operator;
    if (!['add', 'subtract', 'multiply', 'divide'].includes(operator)) {
        throw new Error('Invalid operation. Please enter add, subtract, multiply, or divide.');
    }
    return operator;
};

const calculate = (operator: Operator, num1: number, num2: number): number => {
    switch (operator) {
        case 'add':
            return num1 + num2;
        case 'subtract':
            return num1 - num2;
        case 'multiply':
            return num1 * num2;
        case 'divide':
            if (num2 !== 0) {
                return num1 / num2;
            } else {
                throw new Error('Division by zero is not allowed.');
            }
        default:
            throw new Error('Invalid operator');
    }
};


const operation = getOperation();

const number1 = getUserInput('Enter the first number:');
const number2 = getUserInput('Enter the second number:');

try {
    const result = calculate(operation, number1, number2);
    console.log(`Result of ${operation} operation: ${result}`);
} catch (error) {
    console.error(error.message);
}
