class Info {
    Info({
        required this.bannerUrl,
        required this.category,
        required this.date,
        required this.externalLink,
        required this.title,
        required this.url,
    });

    final String bannerUrl;
    final String category;
    final DateTime date;
    final String externalLink;
    final String title;
    final String url;

    factory Info.fromJSON(Map<String, dynamic> data) => Info(
        bannerUrl: data["banner_url"],
        category: data["category"],
        date: DateTime.parse(data["date"]),
        externalLink: data["external_link"],
        title: data["title"],
        url: data["url"],
    );
}
