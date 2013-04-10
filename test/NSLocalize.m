@implementation NSLocalize

- (void)test {
  NSString *title = NSLocalizedString(@"Simple title", nil);
  NSString *message = NSLocalizedString(@"Complex message with %@ \/", @"Group title");
  NSString *button = NSLocalizedString(@"OK", @"Group title");

  [[[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:button otherButtonTitles:nil] show];
}

@end
