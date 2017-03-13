
ArrayList <PVector> cities = new ArrayList<PVector>();
ArrayList <PVector> minCities = new ArrayList<PVector>();

int numCities=8;
float recordDistance;

void setup() {
  size(400, 300);
  for (int i=0; i<numCities; i++) {
    cities.add(new PVector(random(width), random(height)));
  }
  recordDistance=calcDistance(cities);
  for (int k=0; k<cities.size(); k++) {
    minCities.add(cities.get(k));
  }
}

void draw() {
  background(0);
  fill(255);
  noStroke();
  for (int i=0; i<cities.size(); i++) {
    ellipse(cities.get(i).x, cities.get(i).y, 8, 8);
  }

  stroke(255,150);
  strokeWeight(1);
  noFill();
  beginShape();
  for (int i=0; i<cities.size(); i++) {
    vertex(cities.get(i).x, cities.get(i).y);
  }
  endShape();

  stroke(255, 0, 155);
  strokeWeight(2);
  noFill();
  beginShape();
  for (int i=0; i<minCities.size(); i++) {
    vertex(minCities.get(i).x, minCities.get(i).y);
  }
  endShape();

  int i = floor(random(cities.size()));
  int  j= floor(random(cities.size()));
  cities=swap(cities, i, j);
  float d = calcDistance(cities);
  if (d<recordDistance) {
    recordDistance = d;
    println(recordDistance);
    for (int k=0; k<cities.size(); k++) {
      minCities.set(k, cities.get(k));
    }
  }
}

ArrayList<PVector> swap (ArrayList<PVector> a, int i, int j) {
  PVector temp = new PVector();
  temp = a.get(i);
  a.set(i, a.get(j));
  a.set(j, temp);

  return a;
}

float calcDistance (ArrayList<PVector> points) {
  float sum=0;
  for (int i=0; i<points.size()-1; i++) {
    sum += dist(points.get(i).x, points.get(i).y, points.get(i+1).x, points.get(i+1).y);
  }
  return sum;
}