//
//  ViewController.m
//  firebase
//
//  Created by Silvestre Garcia on 10/28/17.
//  Copyright © 2017 silver. All rights reserved.
//

#import "Home.h"
#import <GoogleSignIn/GoogleSignIn.h>
@import Firebase;

@interface Home () <GIDSignInUIDelegate, GIDSignInDelegate>

@property (weak, nonatomic) IBOutlet GIDSignInButton *btnLogin;

@end

@implementation Home

- (void)viewDidLoad {
    [super viewDidLoad];
    [GIDSignIn sharedInstance].uiDelegate = self;
    [GIDSignIn sharedInstance].clientID = @"701092862750-31r10n4c6m1j0rlv013ju1c6op0h1lhv.apps.googleusercontent.com";
    [GIDSignIn sharedInstance].delegate = self;
    self.btnLogin.style = kGIDSignInButtonStyleIconOnly;
    [FIRAnalytics logEventWithName:@"pantalla_login"
                        parameters:@{
                                     @"name": @"login",
                                     @"full_text": @"accedieron a la pantalla de lgon"
                                     }];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)signInWillDispatch:(GIDSignIn *)signIn error:(NSError *)error {
    //[myActivityIndicator stopAnimating];
}

// Present a view that prompts the user to sign in with Google
- (void)signIn:(GIDSignIn *)signIn
presentViewController:(UIViewController *)viewController {
    [self presentViewController:viewController animated:YES completion:nil];
}

// Dismiss the "Sign in with Google" view
- (void)signIn:(GIDSignIn *)signIn
dismissViewController:(UIViewController *)viewController {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)signIn:(GIDSignIn *)signIn
didSignInForUser:(GIDGoogleUser *)user
     withError:(NSError *)error {
    if (error == nil) {
        [FIRAnalytics logEventWithName:@"boton_login"
                            parameters:@{
                                         @"name": @"login",
                                         @"full_text": @"accedieron a la pantalla de login"
                                         }];
        [self performSegueWithIdentifier:@"toTable" sender:nil];
    } else {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Iniciar sesión" message:@"No se pudo iniciar sesión, intente de nuevo." preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Aceptar" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
}


@end
