
namespace Microsoft.Quantum.Samples.SimpleAlgorithms {

    open Microsoft.Quantum.Arrays as Array;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;

    @EntryPoint()
    operation RunProgram (nQubits : Int) : Unit {
        
         for (parity in 0 .. (1 <<< nQubits) - 1)
        {
            let measuredParity = BernsteinVaziraniTestCase(nQubits, parity);
            if (measuredParity != parity) {
                fail $"Measured parity {measuredParity}, but expected {parity}.";
            }
        }

        Message("All parities measured successfully!");

let elements = nQubits > 0 ? Array.SequenceI(0, (1 <<< nQubits) - 1) | new Int[0];
        if (DeutschJozsaTestCase(nQubits, elements[...2...])) {
            fail "Measured that test case {balancedTestCase} was constant!";
        }

        if (not DeutschJozsaTestCase(nQubits, elements))
        {
            fail "Measured that test case {constantTestCase} was balanced!";
        }

        Message("Both constant and balanced functions measured successfully!");
               for (shift in 0 .. (1 <<< nQubits) - 1)
        {
            let measuredShift = HiddenShiftBentCorrelationTestCase(shift, nQubits / 2);
            if (measuredShift != shift) {
                fail $"Measured shift {measuredShift}, but expected {shift}.";
            }
        }

        Message("Measured hidden shifts successfully!");
    }
}
