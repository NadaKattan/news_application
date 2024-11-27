import 'package:flutter/material.dart';
import 'package:news_application/app_theme.dart';
import 'package:news_application/features/general/presentation/view/search_result.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  CustomSearchDelegate(this.searchList);
  // final viewModel = NewsViewModel();
  List<String> searchList;

  // These methods are mandatory you cannot skip them.
  @override
  List<Widget> buildActions(BuildContext context) {
    // Build the clear button.
    return [
      IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          query = '';
          // When pressed here the query will be cleared from the search bar.
        },
      ),
      IconButton(
        icon: const Icon(Icons.close),
        onPressed: () {
          query = '';
          close(context, query);
          // When pressed here the query will be cleared from the search bar.
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // viewModel.getNews();
    // Build the leading icon.
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => Navigator.of(context).pop(),
      // Exit from the search screen.
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Build the search results.
    // final List<String> searchResults = searchList
    //     .where((item) => item.toLowerCase().contains(query.toLowerCase()))
    //     .toList();
    return SearchResult(
      query: query,
      flag: false,
    );
    // ListView.builder(
    //   itemCount: searchResults.length,
    //   itemBuilder: (context, index) {
    //     return ListTile(
    //       title: Text(searchResults[index]),
    //       onTap: () {
    //         // Handle the selected search result.
    //         close(context, searchResults[index]);
    //       },
    //     );
    //   },
    // );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Build the search suggestions.
    final List<String> suggestionList = query.isEmpty
        ? []
        : searchList
            .where((item) => item.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionList[index]),
          onTap: () {
            Navigator.of(context).pushNamed(SearchResult.routeName,
                arguments: suggestionList[index]);
          },
        );
      },
    );
  }
}
