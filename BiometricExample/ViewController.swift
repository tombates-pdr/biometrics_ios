//
//  ViewController.swift
//  BiometricExample
//
//  Created by Tom Bates on 21/04/2020.
//  Copyright © 2020 Push Doctor. All rights reserved.
//

import UIKit

import Branch

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  @IBAction func saveButtonPressed() {
    guard let access = biometricAccess else { fatalError("") }
    var query = secQuery
    query[kSecUseOperationPrompt] = "TOUCH_ID_DIALOG_DESCRIPTION"
    query[kSecValueData] = "password".data(using: .utf8)
    query[kSecAttrAccessControl] = access
    let result = SecItemAdd(query as CFDictionary, nil)
    print(result)
  }

  @IBAction func nukeButtonPressed() {
    let params: [CFString: Any] = [
      kSecClass: kSecClassGenericPassword,
    ]
    _ = SecItemDelete(params as CFDictionary)
  }

  private var secQuery: [CFString: Any] {
    return [
      kSecAttrDescription: "Auth",
      kSecAttrService: "com.pdr.biometrics",
      kSecClass: kSecClassGenericPassword,
      kSecAttrAccount: "username"
    ]
  }

  var biometricAccess: SecAccessControl? {
    let flags: SecAccessControlCreateFlags
    if #available(iOS 11.3, *) {
      flags = .biometryCurrentSet
    } else {
      flags = .touchIDCurrentSet
    }
    return SecAccessControlCreateWithFlags(nil, kSecAttrAccessibleWhenUnlockedThisDeviceOnly, flags, nil)
  }

}
