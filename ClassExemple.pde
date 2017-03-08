ArrayList<Circle> listeObjet;
Circle monObjetCircle;


void setup() {
  size(1200, 800, P2D);
  monObjetCircle = new Circle(random(width), random(height));
  listeObjet = new ArrayList<Circle>();
  listeObjet.add(monObjetCircle);
}

void draw() {
  background(127);

  float x_ = random(width);
  float y_ = random(height);

  boolean dehors = true;

  for (int i=0; i<listeObjet.size(); i++) {
    Circle cercle = listeObjet.get(i);
    float distance = dist(x_, y_, cercle.x, cercle.y);
    if (distance <= cercle.radius +5) {
      dehors = false;
      break;
    } else {
    }
  }

  if (dehors == true) {
    Circle c = new Circle(x_, y_);
    listeObjet.add(c);
  }

  for (int i=0; i<listeObjet.size(); i++) {
    Circle cercle = listeObjet.get(i);
    for (int j=0; j<listeObjet.size(); j++) {
      Circle other = listeObjet.get(j);
      if (cercle != other) {
        float distance = dist(cercle.x, cercle.y, other.x, other.y);
        if (distance <= cercle.radius + other.radius +2) {
          cercle.growing = false;
        }
      }
    }
  }
  for (int i=0; i<listeObjet.size(); i++) {
    Circle cercle = listeObjet.get(i);

    cercle.grow();
    cercle.display();
    cercle.limitScene();
  }
}

void mousePressed () {
  noLoop () ;
}