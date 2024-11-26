// import 'package:flutter/material.dart';
// import 'package:news_application/core/widgets/error_indicator.dart';
// import 'package:news_application/core/widgets/loading_indicator.dart';
// import 'package:news_application/features/general/presentation/view/news_gen_list.dart';
// import 'package:provider/provider.dart';

// class NewsGenListView extends StatefulWidget {
//   const NewsGenListView({required this.searchWord, super.key});
//   final String searchWord;

//   @override
//   State<NewsGenListView> createState() => _NewsGenListViewState();
// }

// class _NewsGenListViewState extends State<NewsGenListView> {
//   // final viewModel = SourcesViewModel();
//   // @override
//   // void initState() {
//   //   // TODO: implement initState
//   //   super.initState();
//   //   viewModel.getSources(widget.categoryId);
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => viewModel,
//       child: Consumer<SourcesViewModel>(
//         builder: (context, value, child) {
//           if (viewModel.isLoading) {
//             return const LoadingIndicator();
//           } else if (viewModel.errorMessage != null) {
//             return ErrorIndicator(
//               message: viewModel.errorMessage,
//             );
//           } else {
//             return NewsGenList("bitcoin");
//           }
//         },
//       ),
//     );
//   }
// }
