import 'models/environment_base.dart';

const bool isProduction = bool.fromEnvironment('dart.vm.product');

final EnvironmentBase debug = EnvironmentBase(
  uriBase: 'httpdss://jsonplaceholder.typicode.com',
);

final EnvironmentBase production = EnvironmentBase(
  uriBase: 'https://jsonplaceholder.typicode.com',
);

final environment = isProduction ? production : debug;
