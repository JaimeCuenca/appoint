class Tattoo {
  int id;
  String style;
  String zone;
  String size;
  bool bn;
  String desc;
  String time;
  String price;


  Tattoo(this.style, this.zone, this.size, this.bn, this.desc){
    this.price = setPrice();
    this.time = setTime();
  }

  setPrice(){
    switch(this.style){
      case "BLACKWORK": switch(this.size){
        case "<5": return "-1"; break;
        case "5-10": return "60-80"; break;
        case "10-20": return "80-120"; break;
        case "20-40": return "120-220"; break;
        case "40-60": return "220-320"; break;
        default : return ">320"; break;
      }
      break;
      case "TRADICIONAL": switch(this.size){
        case "<5": return "50"; break;
        case "5-10": return "70-80"; break;
        case "10-20": return "80-150"; break;
        case "20-40": return "150-250"; break;
        case "40-60": return "250-350"; break;
        default : return ">350"; break;
      }
      break;
      case "DOTWORK": switch(this.size){
        case "<5": return "50"; break;
        case "5-10": return "60-70"; break;
        case "10-20": return "70-90"; break;
        case "20-40": return "90-160"; break;
        case "40-60": return "160-220"; break;
        default : return ">220"; break;
      }
      break;
      case "ACUARELA": switch(this.size){
        case "<5": return "70"; break;
        case "5-10": return "70-80"; break;
        case "10-20": return "80-110"; break;
        case "20-40": return "110-210"; break;
        case "40-60": return "210-320"; break;
        default : return ">320"; break;
      }
      break;
      case "JAPONES": switch(this.size){
        case "<5": return "60"; break;
        case "5-10": return "60-100"; break;
        case "10-20": return "100-180"; break;
        case "20-40": return "180-220"; break;
        case "40-60": return "220-300"; break;
        default : return ">300"; break;
      }
      break;
      case "REALISMO": switch(this.size){
        case "<5": return "60"; break;
        case "5-10": return "60-120"; break;
        case "10-20": return "120-250"; break;
        case "20-40": return "250-380"; break;
        case "40-60": return "380-500"; break;
        default : return ">500"; break;
      }
      break;
      case "LINE": switch(this.size){
        case "<5": return "30"; break;
        case "5-10": return "30-60"; break;
        case "10-20": return "60-90"; break;
        case "20-40": return "90-120"; break;
        case "40-60": return "120-170"; break;
        default : return ">170"; break;
      }
      break;
    }
  }

  String setTime() {
    switch(this.size){
      case "<5": return this.style=="LINE" ? "1h" : "1h30-2h"; break;
      case "5-10": return this.style=="LINE" ? "1h30" : "2h-3h"; break;
      case "10-20": return this.style=="LINE" ? "2h" : "3h-4h"; break;
      case "20-40": return this.style=="LINE" ? "2h30" : "4h30"; break;
      case "40-60": return this.style=="LINE" ? "2h30" : "5h-6h"; break;
      default : return this.style=="LINE" ? ">3h" : ">6h"; break;
    }
  }
}