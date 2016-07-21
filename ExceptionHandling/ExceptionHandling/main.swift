//
//  main.swift
//  ExceptionHandling
//
//  Created by jyotishankar sahoo on 21/07/16.
//  Copyright © 2016 jyotishankar sahoo. All rights reserved.
//

import Foundation

enum LoginError : ErrorType {
    case EmptyUsername
    case EmptyPassword
}

extension LoginError: CustomStringConvertible{
    var description : String{
        switch self {
        case .EmptyUsername:
            return "Empty User Name"
        case .EmptyPassword:
            return "Empty Password"
        }
    }
}

func loginUserWithUsername(username : String? , password : String?)  throws -> String{
    guard let username = username where username.characters.count > 0 else{
        throw LoginError.EmptyUsername
    }
    
    guard let password = password where password.characters.count > 0 else{
        throw LoginError.EmptyPassword
    }
    return "token_" + username
}

func login()  {
    do{
        let token = try loginUserWithUsername("jyoti", password: "Apple@1234")
        print("logged in User's token is : \(token)")
    }catch LoginError.EmptyUsername{
        print("Empty User Name")
    }catch LoginError.EmptyPassword{
        print("Empty Password")
    }catch{
        print(error)
    }
}

func updatedLogin(){
    do{
        let token = try loginUserWithUsername(nil, password: "123#12")
print("Token is : \(token)")
    }catch let error as LoginError{
        print(error.description)
    }catch{
        print(error)
    }
    
}

login()

updatedLogin()

