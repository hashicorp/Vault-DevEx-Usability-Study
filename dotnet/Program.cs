using System;
using System.Net.Http;

namespace VaultPOC
{
    public class Program
    {
        public static void Main()
        {
            //TODO HC-DevEx-2022: Replace `sampleSecret` with secret fetched from Vault
            var sampleSecret = "❌ Never Hardcode Secrets";

            Console.WriteLine(sampleSecret);
        }
    }
}
// [END all]
