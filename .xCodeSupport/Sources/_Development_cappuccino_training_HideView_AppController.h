
@interface AppController : NSObject
{
    IBOutlet NSWindow* theWindow;
    IBOutlet NSTextField* rigthMultiLine;
    IBOutlet CPWebView* webView;
}
- (IBAction)hideViews:(id)aSender;
@end