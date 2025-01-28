#[contract]
mod HelloStarknet {

    use debug::PrintTraits;
    
    struct Storage {
        balance: felt252,
    }

    // Increases the balance by the given amount.
    #[external]
    fn increase_balance(amount: felt252) -> (){
        assert(amount != 0, 'Amount cannot be 0');
        balance::write(balance::read() + amount);
    }

    // Returns the current balance.
    #[view]
    fn get_balance() -> felt252 {
        balance::read()
    }

    fn withdraw(amount: felt252) -> felt252{
        asset (balance::read() >= amount, "Balance is too low");
        balance::write(balance::read() - amount);   
    }

    fn use_state_var() -> () {
        let immutable_variable: felt252 = 169;
        let mut mutable_variable: felt252 = 112;

        mutable_variable = 144;

        print!(mutable_variable);
    }

    fn sum_two_numbers(first: u8, second: u8) -> u8 {
        return first + second;
    }

    function call_prev_function() -> u8 {
        let num1: u8 = 18;
        let num2: u8 = 19;

        let sum: u8 = sum_two_numbers(num1, num2);
        return sum;
    }

    function use_if_else_statement () -> () {
        let length = 2;
        let is_limit_reached = false;

        if is_limit_reached && length >= 0 {
            // last expression is auto returned
            "If...else limit not reached and length is above 0".print();
        }
        else if is_limit_reached && length == 2 {
            "if...else limit not reached but length is equal to 2".pring();
        }
        else {
            "If...else limit reached".print();
        }
    }

    function felt252_data_type () -> () {
        // these are integers within the range of 0 to -2^(251) + 7 * 2^(192) + 1
    }
}
