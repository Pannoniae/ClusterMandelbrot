package invoke

import dsl4cc.DSLInvoke.RunNode

class TestNode4 {
  static void main(String[] args) {
    def node = new RunNode("127.0.0.1", "127.0.0.4").invoke()
  }
}
