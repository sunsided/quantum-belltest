using System;

using Microsoft.Quantum.Simulation.Core;
using Microsoft.Quantum.Simulation.Simulators;

namespace Bell
{
    class Driver
    {
        static void Main(string[] args)
        {
            // Estimate quantum resources.
            var estimator = new ResourcesEstimator();
            BellTest.Run(estimator, 1000, Result.Zero).Wait();
            System.Console.WriteLine(estimator.ToTSV());

            // Actually run the experiment (assuming the resources are enough).
            using (var qsim = new QuantumSimulator())
            {
                // Try initial values
                var initials = new Result[] { Result.Zero, Result.One };
                foreach (var initial in initials)
                {
                    var res = BellTest.Run(qsim, 1000, initial).Result;
                    var (numZeros, numOnes, agree) = res;
                    System.Console.WriteLine(
                        $"Init:{initial,-4} 0s={numZeros,-4} 1s={numOnes,-4} agree={agree,-4}");
                }
            }

            System.Console.WriteLine("Press any key to continue...");
            Console.ReadKey();
        }
    }
}