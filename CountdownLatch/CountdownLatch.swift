import Foundation

class CountdownLatch {
    var count: Int
    private let dispatch_queue = dispatch_queue_create("CountdownQueue", DISPATCH_QUEUE_SERIAL)
    let semaphore = dispatch_semaphore_create(0)

    init?(count: Int) {
        guard count > 0 else {
            return nil
        }

        self.count = count
    }

    func countdown() {
        dispatch_async(dispatch_queue) {
            self.count -= 1
            if self.count == 0 {
                dispatch_semaphore_signal(self.semaphore)
            }
        }
    }

    func await() {
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER)
    }
}
