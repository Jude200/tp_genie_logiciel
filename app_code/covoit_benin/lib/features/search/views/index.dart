import 'package:covoit_benin/features/search/bloc/search_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location_data_bj/location_data_bj.dart';

class SearchProvider extends StatelessWidget {
  const SearchProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc(),
    );
  }
}

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          return const Column(
            children: [SizedBox(height: 50), _StartingPoint()],
          );
        },
      ),
    );
  }
}

class _StartingPoint extends StatelessWidget {
  const _StartingPoint();

  @override
  Widget build(BuildContext context) {
    context.read<SearchBloc>().add(SearchInitialEvent());

    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Départ : "),
            const SizedBox(height: 30),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Département"),
                        DropdownButton(
                            value: LocationData.department(
                                    state.startingDepartmentCode)!
                                .code,
                            items: LocationData.departmentList(sortBy: 'asc')
                                .map((departement) => DropdownMenuItem(
                                    // onTap: () => {},
                                    value: departement.code,
                                    child: Text(departement.name)))
                                .toList(),
                            onChanged: ((value) => context
                                .read<SearchBloc>()
                                .add(DropdownInputChangeEvent(
                                    input: MapEntry(
                                        '__startingDepartment', value))))),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Ville"),
                        DropdownButton(
                            value: state.startingTownCode,
                            items: LocationData.townsOfDepartment(
                                    state.startingDepartmentCode)
                                .map((town) => DropdownMenuItem(
                                    value: town.code, child: Text(town.name)))
                                .toList(),
                            onChanged: ((value) => context
                                .read<SearchBloc>()
                                .add(DropdownInputChangeEvent(
                                    input:
                                        MapEntry('__startingTown', value))))),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Arrondissement"),
                        DropdownButton(
                            value: state.startDistrictCode,
                            items: LocationData.districtsOfTown(
                                    state.startingTownCode)
                                .map((district) => DropdownMenuItem(
                                    value: district.code,
                                    child: Text(district.name)))
                                .toList(),
                            onChanged: ((value) => context
                                .read<SearchBloc>()
                                .add(DropdownInputChangeEvent(
                                    input: MapEntry(
                                        '__startingDistrict', value))))),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Quartier"),
                        DropdownButton(
                            value: state.startingNeighborhoodCode,
                            items: LocationData.neighborhoodsOfDistrict(
                                    state.startDistrictCode)
                                .map((neighborhood) => DropdownMenuItem(
                                    value: neighborhood.code,
                                    child: Text(neighborhood.name)))
                                .toList(),
                            onChanged: ((value) => context
                                .read<SearchBloc>()
                                .add(DropdownInputChangeEvent(
                                    input: MapEntry(
                                        '__startingHeignborHood', value))))),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
