enum Flavor { develop, production }

class AppConfig {
  factory AppConfig({
    required Flavor flavor,
    required FlavorSettings settings,
  }) {
    _instance ??= AppConfig._(flavor, settings);
    return _instance!;
  }

  AppConfig._(this.flavor, this.settings);

  factory AppConfig.createByFlavor({required Flavor flavor}) {
    switch (flavor) {
      case Flavor.develop:
        return AppConfig(flavor: flavor, settings: FlavorSettings.develop());
      case Flavor.production:
        return AppConfig(flavor: flavor, settings: FlavorSettings.production());
      // ignore: no_default_cases
      default:
        throw Exception('Invalid Flavor');
    }
  }

  final Flavor flavor;
  final FlavorSettings settings;

  static AppConfig? _instance;

  static AppConfig get instance => _instance!;
}

class FlavorSettings {
  FlavorSettings.develop()
    : appName = 'Acb Dev',
      baseApi = 'http://113.161.84.22:8060/',
      privacyPolicy = '',
      afDevKey = 'c6ZmxC4oD6hhkr2icKFRnW',
      appId = '6497170548',
      oneLinkID = '';

  FlavorSettings.production()
    : appName = 'Acb',
      baseApi = 'http://113.161.84.22:8060/',
      privacyPolicy = '',
      afDevKey = 'c6ZmxC4oD6hhkr2icKFRnW',
      appId = '6497170548',
      oneLinkID = '';

  final String appName;
  final String baseApi;
  final String privacyPolicy;

  final String afDevKey;
  final String appId;
  final String oneLinkID;
}
