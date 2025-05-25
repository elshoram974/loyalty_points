abstract final class CalcHelper {
  const CalcHelper();

  static double calcBalance({int? points, int? pointPerPound}){
    if(pointPerPound == 0) return 0;

    points ??= 0;
    pointPerPound ??= 1;
    return points / pointPerPound;
  }
}