/*
 * Copyright IBM Corp. 2022, 2023
 * SPDX-License-Identifier: MIT
 */

package com.example.vaultpoc;

import java.io.IOException;

public class VaultPOC
{
	public static void main(String[] args) throws IOException {
	    //TODO HC-DevEx-2022: Replace `sample_secret` with secret fetched from Vault
	    String sampleSecret = "❌ Never Hardcode Secrets";

	    System.out.println(sampleSecret);
	}
}
