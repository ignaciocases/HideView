
@interface AppController : NSObject
{
    IBOutlet NSWindow* theWindow;
    IBOutlet LPMultiLineTextField* leftMultiLine;
    IBOutlet LPMultiLineTextField* rightMultiLine;
    IBOutlet CPWebView* webView;
}
- (IBAction)hideViews:(id)aSender;
@end