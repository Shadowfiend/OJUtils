@import "BlankSlate.j"

/**
 * A class used to proxy messages to a delegate, but not raise an error if that
 * delegate does not have a given message.
 */
@implementation DelegateProxy : BlankSlate
{
    id delegate;
}

+ (DelegateProxy)proxyWithDelegate:(id)aDelegate
{
    return [[self alloc] initWithDelegate:aDelegate];
}

- (DelegateProxy)initWithDelegate:(id)aDelegate
{
    delegate = aDelegate;

    return self;
}

- (id)methodSignatureForSelector:(SEL)aSelector
{
    return true;
}

- (id)forwardInvocation:(CPInvocation)anInvocation
{
    if ([delegate respondsToSelector:[anInvocation selector]])
        return [anInvocation invokeWithTarget:delegate];
    else
        return null;
}

@end
