int board[][];
int cc, rc;
int scale;

void setup(){
  size(900,900);
  scale=5;
  rc=height/5;
  cc=width/5;
  board= new int[rc][cc];
  for(int r=0; r<rc; r++){
    for(int c=0; c<cc; c++){
      board[r][c]=int(random(2));
    }
  }
  noStroke();
}

void draw(){
  background(0);
  for(int r=0; r<rc; r++){
    for(int c=0; c<cc; c++){
      fill(255*board[r][c]);
      rect(r*scale, c*scale, scale, scale);
    }
  }
  update();
}

void update(){
  int tempBoard[][] = new int[rc][cc];
  int neighbors;
  for(int r=0; r<rc; r++){
    for(int c=0; c<cc; c++){
      neighbors = countNeighbors(r,c);
      tempBoard[r][c] = 0;
      if(neighbors == 3){
        tempBoard[r][c]=1;
      }
      if(neighbors == 2){
        tempBoard[r][c] = board[r][c];
      }
    }
  }
  for(int r=0; r<rc; r++){
    for(int c=0; c<cc; c++){
      board[r][c] = tempBoard[r][c];
    }
  }
}

int countNeighbors(int r, int c){
  int val = 0;
  int range = 1;
  int nR, nC;
  for(int dr = -range; dr <= range; dr++){
    for(int dc = -range; dc <= range; dc++){
      if(dr != 0 || dc != 0){
        nR = ((r + dr)+rc) % rc;
        nC = ((c + dc)+cc) % cc;
        val += board[nR][nC];
      }
    }
  }
  return val;
}
