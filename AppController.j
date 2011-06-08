/*
 * AppController.j
 * HideView
 *
 * Created by Ignacio Cases on June 8, 2011.
 * Copyright 2011, Hnlab.org All rights reserved.
 */

@import <Foundation/CPObject.j>
@import "LPMultiLineTextField.j"

@implementation AppController : CPObject
{
    IBOutlet CPWindow    theWindow; //this "outlet" is connected automatically by the Cib
    IBOutlet LPMultiLineTextField leftMultiLine;
    IBOutlet LPMultiLineTextField rightMultiLine;
    IBOutlet CPWebView webView;
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    // This is called when the application is done loading.
}

- (void)awakeFromCib
{
    // This is called when the cib is done loading.
    // You can implement this method on any object instantiated from a Cib.
    // It's a useful hook for setting up current UI values, and other things.

    // In this case, we want the window from Cib to become our full browser window
    [theWindow setFullPlatformWindow:YES];
    
    [webView setMainFrameURL:@"http://cappuccino.org"];
    [leftMultiLine setStringValue:@"Multi Line\n Text Field\n"];
    [rightMultiLine setStringValue:@"Another Multi Line\nText Field\n"];
}

- (IBAction)hideViews:(id)sender {
    [webView setHidden:YES];
    [leftMultiLine setHidden:YES];
}

@end
