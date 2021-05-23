// Paste your DiceValue tab code after these comments and run your program.
// In some cases, people will have things like ArrayIndexOutOfBounds
// exceptions, but in most cases it will be an ArrayList that contains
// information about where your code did not work on the testing data.
// If the ArrayList is empty, then your program passed all tests and received
// a check.  If it contains any Strings, then go to the TestSuite tab and
// figure out where that String was added to the ArrayList.  For example,
// if "consec3" is in your ArrayList, there is code in the TestSuite tab
// for that, and you can search for "consec3" in that tab.
//
// Your job is to fix the bugs in your program (if any) and resubmit.  You
// have the rest of the period to do so.
// 
// Some quick notes:
// 
// * Welcome to the wonderful world of software, where you may think
//   you tested your code thoroughly, yet it still has bugs that the
//   customers find.  It happens.
// * 2, 3, 3, 4, 5 should produce a return value of 4 from consec(),
//   which was intended to be used for determining whether the player
//   had a straight (large, small, or none).  Think carefully about
//   whether your consec() handles cases like this properly.
// * Full houses can be Yahtzees.  3, 3, 3, 3, 3 is a full house:
//   three threes and two threes.  It usually isn't used for that
//   purpose, but it can be.
// * If you have an error in diceToValues(), fix it first.  Getting that
//   to work may get other things working as well.

// diceToValues() copies the values of each Die into an array of ints
// and returns that array of ints
// diceToValues() copies the values of each Die into an array of ints
// and returns that array of ints


int[] diceToValues(Die[] from) {
  
    int[] to = new int[from.length];
  
     for (int i=0;i<from.length;i++) {
       to[i] = from[i].value;
     }
  
  
  return to;         // stub
}

// Sum the pips on just those dice that match the selected score value
// Example: Given dice values of { 6, 6, 5, 6, 3 } and the value 6, then
// sumPips should return 18
int sumPips(Die[] dice, int value) {
  
  int temp = 0;
  for (int i=0;i<dice.length;i++) {
  if (dice[i].getValue() == value) {
    temp = temp + 1;
  }
  }
  
  return (value * temp);  // stub
}

// isTrips() returns true if there are at least three of a kind.
// Examples for arrays of dice values:
// { 1, 1, 5, 1, 6 } --> true
// { 1, 2, 3, 4, 4 } --> false
// { 2, 2, 2, 2, 4 } --> true (at least three of a kind, can be more of a kind)
boolean isTrips(Die[] dice) {
  
  int[] diceValues = diceToValues(dice);
  
  int recordvalue = 0;
  int recordoccurance = 0;
  int counttwo = 0;
  
  for (int i=0;i<diceValues.length;i++) {
    for (int j=0;j<diceValues.length;j++) {
        if (diceValues[j] == diceValues[i]) {
            counttwo = counttwo + 1;
            if (counttwo > recordoccurance) {
                recordoccurance = counttwo;
                recordvalue = diceValues[i];
            }
        }
    }
    counttwo = 0;
  }
  
  if (recordoccurance >= 3) {
    return true;
  } else {
    return false;
  }
  
}

// isQuads() returns true if there are at least four of a kind.
// Examples for arrays of dice values:
// { 1, 1, 5, 1, 6 } --> false
// { 1, 2, 3, 4, 4 } --> false
// { 2, 2, 2, 2, 4 } --> true 
// { 3, 3, 3, 3, 3 } --> true (at least four of a kind, can be more of a kind)
boolean isQuads(Die[] dice) {
  int[] diceValues = diceToValues(dice);
  
  int recordvalue = 0;
  int recordoccurance = 0;
  int counttwo = 0;
  
  for (int i=0;i<diceValues.length;i++) {
    for (int j=0;j<diceValues.length;j++) {
        if (diceValues[j] == diceValues[i]) {
            counttwo = counttwo + 1;
            if (counttwo > recordoccurance) {
                recordoccurance = counttwo;
                recordvalue = diceValues[i];
            }
        }
    }
    counttwo = 0;
  }
  
  if (recordoccurance >= 4) {
    return true;
  } else {
    return false;
  }
}

// isYahtzee() returns true if all five dice have the same value
// Examples for arrays of dice values:
// { 1, 1, 5, 1, 6 } --> false
// { 3, 3, 3, 3, 3 } --> true
boolean isYahtzee(Die[] dice) {
  int[] diceValues = diceToValues(dice);
  
  int recordvalue = 0;
  int recordoccurance = 0;
  int counttwo = 0;
  
  for (int i=0;i<diceValues.length;i++) {
    for (int j=0;j<diceValues.length;j++) {
        if (diceValues[j] == diceValues[i]) {
            counttwo = counttwo + 1;
            if (counttwo > recordoccurance) {
                recordoccurance = counttwo;
                recordvalue = diceValues[i];
            }
        }
    }
    counttwo = 0;
  }
  
  if (recordoccurance == 5) {
    return true;
  } else {
    return false;
  }
}

// isFullHouse() returns true if three dice have a common value and the
// other two dice have a common value. A Yahtzee is also a full house.
// Examples for arrays of dice values:
// { 1, 1, 5, 1, 5 } --> true
// { 3, 3, 3, 4, 2 } --> false
// { 4, 4, 4, 4, 4 } --> true
boolean isFullHouse(Die[] dice) {
  int[] diceValues = diceToValues(dice);
  
    diceValues = sort(diceValues);
  
    if (diceValues[0] == diceValues[2] && diceValues[3] == diceValues[4]) {
      return true;
    } else if (diceValues[0] == diceValues[1] && diceValues[2] == diceValues[4]) {
      return true;
    } else {
      return false;
    }
  
  
}



// Returns the largest number of consecutive ints in a sorted array
// Example: consec({1, 2, 4, 5, 6}) returns 3 because the longest
// consecutive sequence is {4, 5, 6}.
int consec(int[] sortedNums) {
  
  int record = 1;
  int count = 1;
  
  for (int i=1;i<sortedNums.length;i++) {
    if (sortedNums[i] == sortedNums[i-1] + 1) {
      count = count + 1;
      if (count > record) {
        record = count;
      }
    } else if (sortedNums[i] != sortedNums[i-1]) {
      count = 1;
    }
  }
  
  return record;  // stub
}

// isLargeStraight() returns true if, when sorted, the dice values are
// consecutive integers
// Examples for arrays of dice values:
// { 1, 2, 3, 4, 5 } --> true
// { 2, 3, 4, 5, 6 } --> true
// Anything else --> false
boolean isLargeStraight(Die[] dice) {
  int[] diceValues = diceToValues(dice);
  for (int i=1;i<diceValues.length;i++) {
    if (diceValues[i] != diceValues[i-1]+1) {
      return false;
    }
  }
  return true;  // stub
}

// isSmallStraight() returns true if you can find four dice that
// have consecutive values. TEST isSmallStraight CAREFULLY.
// Examples for arrays of dice values:
// { 1, 2, 3, 4, 4 } --> true
// { 1, 2, 3, 5, 6 } --> false
// { 1, 3, 4, 5, 6 } --> true
// { 2, 3, 4, 4, 5 } --> true
// { 1, 2, 2, 3, 3 } --> false
boolean isSmallStraight(Die[] dice) {
  int[] diceValues = diceToValues(dice);
  
  for (int i=0;i<diceValues.length;i++) {
          for (int j=i;j>0;j--) {
            if (diceValues[i] < diceValues[i-j]) {
              int temp = diceValues[i];
              diceValues[i] = diceValues[i-j];
              diceValues[i-j] = temp;
            }
            } 
      }
      
  
  int record = 1;
  int count = 1;
  
  for (int i=1;i<diceValues.length;i++) {
    if (diceValues[i] == diceValues[i-1] + 1) {
      count = count + 1;
      if (count > record) {
        record = count;
      }
    } else if (diceValues[i] == diceValues[i-1]) {
      if (count > record) {
        record = count;
      }
    } else {
      count = 1;
    }
    if (record == 4) {
      printArray(diceValues);
      System.out.println(record);
       return true;
    }
  }
  
  printArray(diceValues);
  System.out.println(record);
  
  if (record == 4) {
    return true;
  } else {
    return false;
  } 
  
}

// chance() returns the sum of the dice values
// Examples for arrays of dice values:
// { 1, 2, 3, 4, 4 } --> 14
// { 1, 2, 3, 5, 6 } --> 17
int chance(Die[] dice) {
  int[] diceValues = diceToValues(dice);
  int count = 0;
  for (int i=0;i<diceValues.length;i++) {
    count = count + diceValues[i];
  }
  return count;  // stub
}

// You can test your work by printing out stuff in testSuite()
void testSuite() {
  System.out.println("Please replace me with meaningful test code.");
  System.out.println("It currently prints out the sum of 5s on the dice, which is boring.");
  
  Die[] d = new Die[5];
  for (int i=0;i<d.length;i++) {
    d[i] = new Die(6);
  }
  d[0].setValue(2);
  d[1].setValue(3);
  d[2].setValue(4);
  d[3].setValue(4);
  d[4].setValue(5);
  System.out.println( isSmallStraight(d) );   //isLargeStraight( new int[] {1, 2, 3, 4, 5, 6} )
  //printArray(diceToValues(d));
  System.out.println();
}
