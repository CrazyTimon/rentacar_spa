const CARS = '/car';
const CLASSIFICATIONS = '/classification';
const GEARBOXES = '/gearbox';

class UrlUtils {
  static const String _hostProtocol = 'http://';
  static const String _hostUrl = 'localhost';
  static const _hostPort = 8081;
  static String generateUrl(String urlAdress) => '$_hostProtocol$_hostUrl:$_hostPort$urlAdress';
}