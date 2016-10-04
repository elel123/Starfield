//your code here
Particle [] nParticle;
void setup()
{
	size(600, 600);
	//your code here
	nParticle = new Particle[3000];
	for(int i = 0; i < nParticle.length; i++)
	{
		nParticle[i] = new NormalParticle(300, 300);

		if( i % 23 == 0)
		{
			nParticle[i] = new JumboParticle(300, 300);
		}

	}

	nParticle[1] = new OddballParticle(300, 300);
}

void draw()
{
	background(0);
	//your code here
	for(int i = 0; i < nParticle.length; i++)
	{
		nParticle[i].move();
		nParticle[i].show();
	}
}

class NormalParticle implements Particle
{
	//your code here
	double myX, myY, dSpeed, dAngle;
	int cRed, cGreen, cBlue;
	NormalParticle()
	{

	}

	NormalParticle(float x, float y)
	{
		myX = x;
		myY = y;
		dAngle = Math.random()*2*Math.PI;
		dSpeed = Math.random()*5;
		cRed = (int)(Math.random() * 16) + 239;
		cGreen = 255;
		cBlue = (int)(Math.random() * 255);
	}

	public void move()
	{
		myX = myX + cos((float)dAngle) * dSpeed;
		myY = myY + sin((float)dAngle) * dSpeed;

		if(((float) myX > 600) || ((float) myX < 0) && ((float) myY > 600) || ((float) myY < 0))
		{
			myX = myY = 300;
			dSpeed = dSpeed / 2;
			dAngle = dAngle + Math.random()*2*Math.PI;
			cRed = (int)(Math.random() * 16) + 239;
			cBlue = (int)(Math.random() * 255);
		}

		if(mousePressed)
		{
			dSpeed = dSpeed * 1.025;
		}

		if(keyPressed)
		{
			dAngle = dAngle + Math.random() * 2 * Math.PI;
		}
	}

	public void show()
	{
		fill(cRed, cGreen, cBlue);
		//fill(255);
		ellipse((float) myX, (float) myY, 4.5, 4.5);
	}
}

interface Particle
{
	//your code here
	public void move();
	public void show();
}

class OddballParticle implements Particle//uses an interface
{
	double myX, myY, dSpeed;
	int cRed, cGreen, cBlue;
	//your code here
	OddballParticle(float x, float y)
	{
		myX = x;
		myY = y;
		dSpeed = Math.random()*5;

	}

	public void move()
	{
		myX = myX + Math.random() * dSpeed - (dSpeed / 2);
		myY = myY + Math.random() * dSpeed - (dSpeed / 2);
		if(((float) myX > 600) || ((float) myX < 0) && ((float) myY > 600) || ((float) myY < 0))
		{
			myX = myY = 300;
		}
	}

	public void show()
	{
		fill(255);
		rect((float) myX, (float) myY, 20, 20);
	}
}

class JumboParticle extends NormalParticle //uses inheritance
{
	//your code here
	JumboParticle(float x, float y)
	{
		cBlue = (int)(Math.random() * 220) + 35;
		myX = x;
		myY = y;
		dAngle = Math.random()*2*Math.PI;
		dSpeed = Math.random()*5;
	}
	public void show()
	{
		fill(cBlue); //greyscale
		ellipse((float) myX, (float) myY, 10, 10);
	}
	
}

