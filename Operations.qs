namespace Bell
{
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;

    operation Set (desired: Result, q1: Qubit) : Unit {
        if (desired != M(q1)) {
            X(q1);
        }
    }

    operation BellTest (count: Int, initial: Result) : (Int, Int, Int) {

        mutable numOnes = 0;
        mutable agree = 0;

        using ((q0, q1) = (Qubit(), Qubit())) {

            for (test in 1..count) {

                // Initialize to a defined state.
                Set(initial, q0);
                Set(Zero, q1);
                
                // Create bell state (entanglement).
                H(q0);
                CNOT(q0, q1);

                // Measure the qubit.
                let res = M(q0);

                // Count the number of agreeing measurements.
                if (M(q1) == res) {
                    set agree += 1;
                }

                // Count the number of ones we saw:
                if (res == One) {
                    set numOnes += 1;
                }

            }
            
            // Reset qubits.
            // TODO: Why?
            Set(Zero, q0);
            Set(Zero, q1);
        }

        // Return number of times we saw a |0> and number of times we saw a |1>,
        // as well as the number of times the measurements of q0 and q1
        // were identical.
        return (count-numOnes, numOnes, agree);
    }
}
