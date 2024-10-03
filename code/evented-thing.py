# Define the "EventedThing" class, so that its instances have
# an "on" and a "trigger" method to react to events. For example:
#
# eventedThing.on('meet', function (name) {
#  console.log('Nice to meet you, ' + name + '.');
# });
#
# eventedThing.trigger('meet', 'Sarah');
# -> 'Hi there!'
# -> 'Nice to meet you, Sarah.'
#
# eventedThing.trigger('whatever');
# -> nothing happens

import inspect

class EventedThing:
    def __init__(self):
        self.store = {}

    def on(self, name, handler):
        if name not in self.store:
            self.store[name] = []
        self.store[name].append(handler)
    
    def trigger(self, name, *args, **kwargs):
        if name in self.store:
            for handler in self.store[name]:
                sig = inspect.signature(handler)
                params = sig.parameters
                if len(params) == 0:
                    handler()
                else:
                    handler(*args, **kwargs)
        else:
            pass  # Do nothing if the event is not registered


eventedThing = EventedThing()

# Define handlers
def say_hi():
    print('Hi there!')

def greet(name):
    print('Nice to meet you, ' + name + '.')


# Register handlers
eventedThing.on('meet', say_hi)
eventedThing.on('meet', greet)

# Trigger the 'meet' event
eventedThing.trigger('meet', 'Sarah')

# Output:
# Hi there!
# Nice to meet you, Sarah.

# Trigger an unregistered event
eventedThing.trigger('whatever')
# Output:
# (Nothing happens)



