// Copyright IBM Corp. 2022, 2026
// SPDX-License-Identifier: MIT

package main

import "fmt"

func main() {
	//TODO HC-DevEx-2022: Replace `sampleSecret` with secret fetched from Vault
	var sampleSecret = "❌ Never Hardcode Secrets"

	fmt.Println(sampleSecret)
}
