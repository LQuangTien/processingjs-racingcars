if(first[0] >second[0] && first[0] < second[1]){
    if(first[2] > second[2] && first[2] < second[3]){
      return true
    }
  }
  
  if(first[0] >second[0] && first[0] < second[1]){
    if(first[3] > second[2] && first[3] < second[3]){
      return true
    }
  }

  if(first[1] >second[0] && first[1] < second[1]){
    if(first[2] > second[2] && first[2] < second[3]){
      return true
    }
  }

  if(first[1] >second[0] && first[1] < second[1]){
    if(first[3] > second[2] && first[3] < second[3]){
      return true
    }
  }

  //

  if(second[0] > first[0] && second[0] < first[1]){
    if(second[2] > first[2] && second[2] < first[3]){
    return true
    }
  }

  if(second[0] > first[0] && second[0] < first[1]){
    if(second[3] > first[2] && second[3] < first[3]){
    return true
    }
  }

  if(second[1] > first[0] && second[1] < first[1]){
    if(second[2] > first[2] && second[2] < first[3]){
    return true
    }
  }

  if(second[1] > first[0] && second[1] < first[1]){
    if(second[3] > first[2] && second[3] < first[3]){
    return true
    }
  }
