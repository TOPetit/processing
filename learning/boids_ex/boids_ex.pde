int n = 30, // Number of boids
f = 400, // Number of frames
i,j,z = 255,w = 500; // temp*2, and two constants
float d = 200. / n; // Boid diameter
PVector m; // temp
B[]a = new B[n];
void setup() { // This is automatically called at startup
    size(500,500); // Can't use variables for this without extra bytes for settings()
    fill(z,0,0);
    randomSeed(n); // seeded from number of Boids, so that n=19 is very different from n=20
    for (i = 0;i < n;a[i++] = new B(new PVector(random(w),random(w)),m.fromAngle(random(TAU))));
}
void draw() { // This is automatically called each frame
    background(z);
    for (B b : a)
        b.u();
}

class B{ // Boid
    PVector p,v,e,q,r; // Position, Velocity, Next velocity, and two temp vectors
    ArrayList<B>n; // List of neighbors
    B(PVector m,PVector o) {
        p = m;
        v = o;
    }
    void u() { // Update function, does rules and redraw for this Boid
        e = v.copy();
        n = new ArrayList();
        for (B b : a) { // Test a Boid and its eight ghosts for neighborship
            if (b!= this) // Note: Assumes neighborhood diameter < min(width,height)
                // The ghosts are to check if it'd be closer to measure by wrapping
                // We need eight for wrapping north, east, south, west, northeast,
                // northwest, southeast, and southwest. And also the non-wrapped one.
                // The above assumption ensures that each ghost is further apart than
                // the neighborhood diameter, meaning that only one neighbor might be
                // foundfor each boid. To test this, place a boid in each corner, right
                // to the edge, facing away from center. Each boid should find three
                // neighbors, that are the three other boids.
                for (i =-  w;i <=  w;i += w)for (j =-  w;j <=  w;j += w)t(i,j,b);
                }
        if (n.size()>0) {
            q = new PVector();
            r = q.copy();
            for (B b : n) {
                q.add(b.v); // Velocity matching, pt 1
                r.add(b.p); // Flock centering, pt 1
                if (p.dist(b.p)<= d)  
                    e.add(p).sub(b.p); // Collision avoidance
            }
            e.add(q.div(n.size()).sub(v).div(10)); // Velocity matching, pt 2
            e.add(r.div(n.size()).sub(p).div(50)); // Flock centering, pt 2
        }
        p.add(e.limit(d / 10)); // Update vectors
        v = e.mult(10);
        p.set((p.x + w) % w,(p.y + w) % w); // Wrapping
        noStroke();
        ellipse(p.x,p.y,d,d); // Draw Boid, finally
        stroke(0,0,z);
        line(p.x,p.y,p.x + v.x,p.y + v.y);
    }
    void t(int x,int y,B o) { // Test if a Boid (or a ghost) is a neighbor
        m = o.p.copy().add(x,y);
        if (2 * d >=  p.dist(m) & q.angleBetween(v,q.sub(m,p))<= 5 * PI / 6)
            n.add(new B(m,o.v));
    }
}