//your code here
NormalParticle [] nParticle;
void setup()
{
	//your code here
	nParticle = new NormalParticle[5];
}

void draw()
{
	//your code here
}

class NormalParticle
{
	//your code here
	double myX, myY, dSpeed, dAngle;
	int cRed, cGreen, cBlue;

	NormalParticle(float x, float y)
	{
		myX = x;
		myY = y;
		dAngle = Math.random()*2*Math.PI;
		dSpeed = Math.random()*10;
		cRed = (int)(Math.random() * 255);
		cGreen = (int)(Math.random() * 255);
		cBlue = (int)(Math.random() * 255);
	}

	void move()
	{
		myX = myX + cos(dAngle) * dSpeed;
		myY = myY + sin(dAngle) * dSpeed;
	}

	void show()
	{
		fill(cRed, cGreen, cBlue);
		ellipse(myX, myY, 4, 4);
	}
}

interface Particle
{
	//your code here
}

class OddballParticle //uses an interface
{
	//your code here
}

class JumboParticle //uses inheritance
{
	//your code here
}

