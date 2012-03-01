// var print = console.log;

// function makeAccount(){
    // function WithdrawError(bal, amt){
        // this.name = "WithdrawError";
        // this.message = "Balance: " + bal + " less than amount to withdraw: " + amt;
    // }
    // WithdrawError.prototype = new Error();
    // WithdrawError.prototype.constructor = WithdrawError;
    
    // var balance = 0;
    // function deposit(amt){
        // balance = balance + amt;
        // return balance;
    // }
    // function withdraw(amt){
        // if (amt > balance) {
            // throw new WithdrawError(balance, amt);
        // }
        // balance -= amt;
        // return balance;
    // }
    // function checkBal(){
        // return balance;
    // }
    // var dispatch = {'deposit':deposit,
                    // 'withdraw':withdraw,
                    // 'checkBal':checkBal
                    // }
    // return dispatch;                
// }

// var account = makeAccount();


// print("Balance: " + account['checkBal']());
// print("After Balance: " + account['deposit'](50));

// print("Balance: " + account['checkBal']());
// try{
    // print("After Withdraw: " + account['withdraw'](150));
// } catch(e){
    // print(e.toString());
// }
// print("Value of a: " + a);


function Car(make){
    Car.count = 0;
    this.make = make;
    this.model = "DefaultModel";
    var year = 1995;
    function privateFunc(){
        console.log(year);
    }
    this.privilegedFunc = function(){
        privateFunc();
    }
    this.toString = this.getMake = function(){return make;};
}

var car = new Car("Ford");
console.log(car.year);
console.log(car.toString());
console.log(car.getMake());
car.privilegedFunc();