// You can test your work by printing out stuff in testSuite()
void testSuite2() {
  Die[] testDice = new Die[DICE];
  for (int i = 0; i < testDice.length; i++) {
    testDice[i] = new Die(SIDES);
  }
  ArrayList<String> errorList = new ArrayList<String>();
  boolean isError = false;
  
  // diceToValues { 6, 6, 5, 6, 3 }
  testDice[0].setValue(6);
  testDice[1].setValue(6);
  testDice[2].setValue(5);
  testDice[3].setValue(6);
  testDice[4].setValue(3);
  int[] nums = diceToValues(testDice);
  
  if (!(nums[0] == 6 && nums[1] == 6 && nums[2] == 5 && nums[3] == 6 && nums[4] == 3)) errorList.add("diceToValues");
  
  // sumPips
  // { 6, 6, 5, 6, 3 }
 
  if (!(sumPips(testDice,6) == 18 && sumPips(testDice,1) == 0 && sumPips(testDice,3) == 3)) errorList.add("sumPips");
  
  // isTrips
  // { 1, 1, 5, 1, 6 } --> true
  testDice[0].setValue(1);
  testDice[1].setValue(1);
  testDice[2].setValue(5);
  testDice[3].setValue(1);
  testDice[4].setValue(6);
  isError = isError || (!isTrips(testDice));
  if (isError) {
    errorList.add("trips1");
    isError = false;
  }

  // { 1, 2, 3, 4, 4 } --> false
  testDice[0].setValue(1);
  testDice[1].setValue(2);
  testDice[2].setValue(3);
  testDice[3].setValue(4);
  testDice[4].setValue(4);
  isError = isError || (isTrips(testDice));
  if (isError) {
    errorList.add("trips2");
    isError = false;
  }
  // { 2, 2, 2, 4, 2 } --> true (at least three of a kind, can be more of a kind)
  testDice[0].setValue(2);
  testDice[1].setValue(2);
  testDice[2].setValue(2);
  testDice[3].setValue(4);
  testDice[4].setValue(2);
  isError = isError || (!isTrips(testDice));
  if (isError) {
    errorList.add("trips3");
    isError = false;
  }
  //if (isError) errorList.add("isTrips");
  
  // isQuads
  isError = false;
  // { 1, 1, 5, 1, 6 } --> false
  testDice[0].setValue(1);
  testDice[1].setValue(1);
  testDice[2].setValue(5);
  testDice[3].setValue(1);
  testDice[4].setValue(6);
  isError = isError || (isQuads(testDice));
  if (isError) {
    errorList.add("quads1");
    isError = false;
  }
  // { 1, 2, 3, 4, 4 } --> false
  testDice[0].setValue(1);
  testDice[1].setValue(2);
  testDice[2].setValue(3);
  testDice[3].setValue(4);
  testDice[4].setValue(4);
  isError = isError || (isQuads(testDice));
  if (isError) {
    errorList.add("quads2");
    isError = false;
  }
  // { 2, 2, 2, 4, 2 } --> true 
  testDice[0].setValue(2);
  testDice[1].setValue(2);
  testDice[2].setValue(2);
  testDice[3].setValue(4);
  testDice[4].setValue(2);
  isError = isError || (!isQuads(testDice));
  if (isError) {
    errorList.add("quads3");
    isError = false;
  }
  // { 3, 3, 3, 3, 3 } --> true (at least four of a kind, can be more of a kind)
  testDice[0].setValue(3);
  testDice[1].setValue(3);
  testDice[2].setValue(3);
  testDice[3].setValue(3);
  testDice[4].setValue(3);
  isError = isError || (!isQuads(testDice));
  if (isError) {
    errorList.add("quads4");
    isError = false;
  }
  
  //if (isError) errorList.add("isQuads");
  
  // isYahtzee
  isError = false;
  // { 1, 1, 5, 1, 6 } --> false
  testDice[0].setValue(1);
  testDice[1].setValue(1);
  testDice[2].setValue(5);
  testDice[3].setValue(1);
  testDice[4].setValue(6);
  isError = isError || (isYahtzee(testDice));
  if (isError) {
    errorList.add("yahtzee1");
    isError = false;
  }
  // { 3, 3, 3, 3, 3 } --> true (at least four of a kind, can be more of a kind)
  testDice[0].setValue(3);
  testDice[1].setValue(3);
  testDice[2].setValue(3);
  testDice[3].setValue(3);
  testDice[4].setValue(3);
  isError = isError || (!isYahtzee(testDice));
  if (isError) {
    errorList.add("yahtzee2");
    isError = false;
  }
  
  //if (isError) errorList.add("isYahtzee");
  
  // isFullHouse
  isError = false;
  // { 1, 1, 5, 1, 5 } --> true
  testDice[0].setValue(1);
  testDice[1].setValue(1);
  testDice[2].setValue(5);
  testDice[3].setValue(1);
  testDice[4].setValue(5);
  isError = isError || (!isFullHouse(testDice));
  if (isError) {
    errorList.add("fullHouse1");
    isError = false;
  }
  // { 3, 3, 3, 4, 2 } --> false
  testDice[0].setValue(3);
  testDice[1].setValue(3);
  testDice[2].setValue(3);
  testDice[3].setValue(4);
  testDice[4].setValue(2);
  isError = isError || (isFullHouse(testDice));
  if (isError) {
    errorList.add("fullHouse2");
    isError = false;
  }
  // { 3, 3, 3, 3, 3 } --> true
  testDice[0].setValue(3);
  testDice[1].setValue(3);
  testDice[2].setValue(3);
  testDice[3].setValue(3);
  testDice[4].setValue(3);
  isError = isError || (!isFullHouse(testDice));
  if (isError) {
    errorList.add("fullHouse3");
    isError = false;
  }
  
  //if (isError) errorList.add("isFullHouse");
  
  // consec
  isError = false;
  // { 1, 2, 4, 5, 6 } --> 3
  testDice[0].setValue(1);
  testDice[1].setValue(2);
  testDice[2].setValue(4);
  testDice[3].setValue(5);
  testDice[4].setValue(6);
  isError = isError || (!(consec(diceToValues(testDice)) == 3));
  if (isError) {
    errorList.add("consec1");
    isError = false;
  }
  // { 1, 1, 2, 3, 4 } --> 4
  testDice[0].setValue(1);
  testDice[1].setValue(1);
  testDice[2].setValue(2);
  testDice[3].setValue(3);
  testDice[4].setValue(4);
  isError = isError || (!(consec(diceToValues(testDice)) == 4));
  if (isError) {
    errorList.add("consec2");
    isError = false;
  }
  // { 2, 3, 3, 4, 5 } --> 4
  testDice[0].setValue(2);
  testDice[1].setValue(3);
  testDice[2].setValue(3);
  testDice[3].setValue(4);
  testDice[4].setValue(5);
  isError = isError || (!(consec(diceToValues(testDice)) == 4));
  if (isError) {
    errorList.add("consec3");
    isError = false;
  }
  // { 3, 3, 3, 3, 3 } --> 1
  testDice[0].setValue(3);
  testDice[1].setValue(3);
  testDice[2].setValue(3);
  testDice[3].setValue(3);
  testDice[4].setValue(3);
  isError = isError || (!(consec(diceToValues(testDice)) == 1));
  if (isError) {
    errorList.add("consec4");
    isError = false;
  }
  // { 2, 4, 4, 6, 6 } --> 1
  testDice[0].setValue(2);
  testDice[1].setValue(4);
  testDice[2].setValue(4);
  testDice[3].setValue(6);
  testDice[4].setValue(6);
  isError = isError || (!(consec(diceToValues(testDice)) == 1));
  if (isError) {
    errorList.add("consec5");
    isError = false;
  }
  // { 1, 3, 3, 4, 6 } --> 2
  testDice[0].setValue(1);
  testDice[1].setValue(3);
  testDice[2].setValue(3);
  testDice[3].setValue(4);
  testDice[4].setValue(6);
  isError = isError || (!(consec(diceToValues(testDice)) == 2));
  if (isError) {
    errorList.add("consec6");
    isError = false;
  }
  // { 1, 2, 3, 4, 5 } --> 5
  testDice[0].setValue(1);
  testDice[1].setValue(2);
  testDice[2].setValue(3);
  testDice[3].setValue(4);
  testDice[4].setValue(5);
  isError = isError || (!(consec(diceToValues(testDice)) == 5));
  if (isError) {
    errorList.add("consec7");
    isError = false;
  }
  // { 2, 3, 4, 5, 6 } --> 5
  testDice[0].setValue(2);
  testDice[1].setValue(3);
  testDice[2].setValue(4);
  testDice[3].setValue(5);
  testDice[4].setValue(6);
  isError = isError || (!(consec(diceToValues(testDice)) == 5));
  if (isError) {
    errorList.add("consec8");
    isError = false;
  }

  //if (isError) errorList.add("consec");
  
  // isLargeStraight
  isError = false;
  // { 1, 2, 3, 4, 5 } --> true
  testDice[0].setValue(1);
  testDice[1].setValue(2);
  testDice[2].setValue(3);
  testDice[3].setValue(4);
  testDice[4].setValue(5);
  isError = isError || (!(isLargeStraight(testDice)));
  if (isError) {
    errorList.add("largeStraight1");
    isError = false;
  }
  // { 2, 3, 4, 5, 6 } --> true
  testDice[0].setValue(2);
  testDice[1].setValue(3);
  testDice[2].setValue(4);
  testDice[3].setValue(5);
  testDice[4].setValue(6);
  isError = isError || (!(isLargeStraight(testDice)));
  if (isError) {
    errorList.add("largeStraight2");
    isError = false;
  }
  
  // Anything else --> false
  testDice[0].setValue(2);
  testDice[1].setValue(3);
  testDice[2].setValue(4);
  testDice[3].setValue(5);
  testDice[4].setValue(5);
  isError = isError || (isLargeStraight(testDice));
  if (isError) {
    errorList.add("largeStraight3");
    isError = false;
  }

  testDice[0].setValue(1);
  testDice[1].setValue(3);
  testDice[2].setValue(4);
  testDice[3].setValue(5);
  testDice[4].setValue(6);
  isError = isError || (isLargeStraight(testDice));
  if (isError) {
    errorList.add("largeStraight4");
    isError = false;
  }

  //if (isError) errorList.add("isLargeStraight");

  // isSmallStraight
  isError = false;
  // { 1, 2, 3, 4, 4 } --> true
  testDice[0].setValue(1);
  testDice[1].setValue(2);
  testDice[2].setValue(3);
  testDice[3].setValue(4);
  testDice[4].setValue(4);
  isError = isError || (!(isSmallStraight(testDice)));
  if (isError) {
    errorList.add("isSmallStraight1");
    isError = false;
  }
  
  // { 1, 2, 3, 5, 6 } --> false
  testDice[0].setValue(1);
  testDice[1].setValue(2);
  testDice[2].setValue(3);
  testDice[3].setValue(5);
  testDice[4].setValue(6);
  isError = isError || (isSmallStraight(testDice));
  if (isError) {
    errorList.add("isSmallStraight2");
    isError = false;
  }

// { 1, 3, 4, 5, 6 } --> true
  testDice[0].setValue(1);
  testDice[1].setValue(3);
  testDice[2].setValue(4);
  testDice[3].setValue(5);
  testDice[4].setValue(6);
  isError = isError || (!(isSmallStraight(testDice)));
  if (isError) {
    errorList.add("isSmallStraight3");
    isError = false;
  }

  // { 2, 3, 4, 4, 5 } --> true
  testDice[0].setValue(2);
  testDice[1].setValue(3);
  testDice[2].setValue(4);
  testDice[3].setValue(4);
  testDice[4].setValue(5);
  isError = isError || (!(isSmallStraight(testDice)));
  if (isError) {
    errorList.add("isSmallStraight4");
    isError = false;
  }

  // { 1, 2, 2, 3, 3 } --> false
  testDice[0].setValue(1);
  testDice[1].setValue(2);
  testDice[2].setValue(2);
  testDice[3].setValue(3);
  testDice[4].setValue(3);
  isError = isError || (isSmallStraight(testDice));
  if (isError) {
    errorList.add("isSmallStraight5");
    isError = false;
  }

  //if (isError) errorList.add("isSmallStraight");

  // chance
  isError = false;
  // { 1, 2, 3, 4, 4 } --> 14
  testDice[0].setValue(1);
  testDice[1].setValue(2);
  testDice[2].setValue(3);
  testDice[3].setValue(4);
  testDice[4].setValue(4);
  isError = isError || !(chance(testDice) == 14);
  if (isError) {
    errorList.add("chance1");
    isError = false;
  }

  // { 1, 2, 3, 5, 6 } --> 17
  testDice[0].setValue(1);
  testDice[1].setValue(2);
  testDice[2].setValue(3);
  testDice[3].setValue(5);
  testDice[4].setValue(6);
  isError = isError || !(chance(testDice) == 17);
  if (isError) {
    errorList.add("chance2");
    isError = false;
  }

  //if (isError) errorList.add("chance");

  println(errorList);

}
