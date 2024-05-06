import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:httprequest/load_data_source.dart';
import 'package:httprequest/posts_model.dart';


class PageDetailCountries extends StatefulWidget {
  const PageDetailCountries({Key? key}) : super(key: key);

  @override
  _PageDetailCountriesState createState() => _PageDetailCountriesState();
}

class _PageDetailCountriesState extends State<PageDetailCountries> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Countries Detail"),
      ),
      body: _buildDetailPostsBody(),
    );
  }

  Widget _buildDetailPostsBody() {
    return Container(
      child: FutureBuilder(
        future: PostsDataSource.instance.loadPosts(),
        builder: (
            BuildContext context,
            AsyncSnapshot<dynamic> snapshot,
            ) {
          if (snapshot.hasError) {
            return _buildErrorSection();
          }

          if (snapshot.hasData) {
            PostsModel postsModel =
            PostsModel.fromJson(snapshot.data);
            return _buildSuccessSection(postsModel);
          }

          return _buildLoadingSection();
        },
      ),
    );
  }

  Widget _buildErrorSection() {
    return Text("Error");
  }

  Widget _buildEmptySection() {
    return Text("Empty");
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(PostsModel data) {
    return ListView.builder(
      itemCount: data.?.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildItemCountries("${data.countries?[index].name}");
      },
    );
  }

  Widget _buildItemCountries(String value) {
    return Text(value);
  }
}
