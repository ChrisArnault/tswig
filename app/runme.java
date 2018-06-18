// runme.java

package app;

public class runme {
  static {
    System.loadLibrary("a");
  }

  public static void main(String argv[]) {
    System.out.println(ca.a.fact(5));

    ca.a.Vector v = new ca.a.Vector();
    v.setX(3.5);
    v.setY(7.2);
    double x = v.getX();
    double y = v.getY();
    System.out.println(x);
    System.out.println(y);
  }
}


