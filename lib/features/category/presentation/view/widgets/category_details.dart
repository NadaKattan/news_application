import 'package:flutter/material.dart';
import 'package:news_application/features/sources/presentation/view_models/sources_view_model.dart';
import 'package:news_application/features/sources/presentation/view/sources_tabs.dart';
import 'package:news_application/core/widgets/error_indicator.dart';
import 'package:news_application/core/widgets/loading_indicator.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails({required this.categoryId, super.key});
  final String categoryId;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  final viewModel = SourcesViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSources(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: Consumer<SourcesViewModel>(
        builder: (context, value, child) {
          if (viewModel.isLoading) {
            return const LoadingIndicator();
          } else if (viewModel.errorMessage != null) {
            return ErrorIndicator(
              message: viewModel.errorMessage,
            );
          } else {
            return SourcesTabs(
              sources: viewModel.sources,
            );
          }
        },
      ),
    );
  }
}
