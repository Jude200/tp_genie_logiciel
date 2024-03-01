import 'package:covoit_benin/features/cars/bloc/vehicle_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class RegisterVehicleProvider extends StatelessWidget {
  final String? carId;
  const RegisterVehicleProvider({super.key, this.carId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => VehicleBloc(carId), child: const RegisterVehicleView());
  }
}

class RegisterVehicleView extends StatelessWidget {
  const RegisterVehicleView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
            _MarkInput(),
            SizedBox(height: 20),
            _PlateNumberInput(),
            SizedBox(height: 20),
            _EnginNumberInput(),
            SizedBox(height: 20),
            _PlacesNumberInput(),
            SizedBox(height: 20),
            _PhotosInput(),
            SizedBox(height: 20),
            _SubmitBtn()
          ],
        ),
      ),
    );
  }
}

class _SubmitBtn extends StatelessWidget {
  const _SubmitBtn();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VehicleBloc, VehicleState>(
      builder: (context, state) {
        return state.status.isInProgress
            ? const CircularProgressIndicator()
            : ElevatedButton(
                onPressed: state.isValid
                    ? () {
                        context.read<VehicleBloc>().add(VehicleSubmitted());
                      }
                    : null,
                child: const Text("S'inscrire"));
      },
    );
  }
}

class _MarkInput extends StatelessWidget {
  const _MarkInput();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Marque", style: TextStyle(fontWeight: FontWeight.bold)),
          BlocBuilder<VehicleBloc, VehicleState>(
            buildWhen: (previous, current) => previous.mark != current.mark,
            builder: (context, state) {
              return TextFormField(
                onChanged: (value) => context
                    .read<VehicleBloc>()
                    .add(VehicleMarkChanged(mark: value)),
                decoration: InputDecoration(
                  hintText: "TOYOTA",
                  filled: true,
                  fillColor: Colors.green.withOpacity(.1),
                  border: InputBorder.none,
                  errorText:
                      state.mark.displayError != null ? 'Invalide' : null,
                ),
                // validator: (nom) => nom!.isEmpty ? 'Entrez votre nom' : null,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _PlateNumberInput extends StatelessWidget {
  const _PlateNumberInput();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Numéro de la Plaque",
              style: TextStyle(fontWeight: FontWeight.bold)),
          BlocBuilder<VehicleBloc, VehicleState>(
            buildWhen: (previous, current) =>
                previous.plateNumber != current.plateNumber,
            builder: (context, state) {
              return TextFormField(
                onChanged: (value) => context
                    .read<VehicleBloc>()
                    .add(VehiclePlateNumberChanged(plateNumber: value)),
                decoration: InputDecoration(
                  hintText: "AB 1234",
                  filled: true,
                  fillColor: Colors.green.withOpacity(.1),
                  border: InputBorder.none,
                  errorText: state.plateNumber.displayError != null
                      ? 'Invalide'
                      : null,
                ),
                // validator: (nom) => nom!.isEmpty ? 'Entrez votre nom' : null,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _EnginNumberInput extends StatelessWidget {
  const _EnginNumberInput();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Numéro du Moteur",
              style: TextStyle(fontWeight: FontWeight.bold)),
          BlocBuilder<VehicleBloc, VehicleState>(
            buildWhen: (previous, current) =>
                previous.enginNumber != current.enginNumber,
            builder: (context, state) {
              return TextFormField(
                onChanged: (value) => context
                    .read<VehicleBloc>()
                    .add(VehicleEnginNumberChanged(enginNumber: value)),
                decoration: InputDecoration(
                  hintText: "4523 4237 1200 2366",
                  filled: true,
                  fillColor: Colors.green.withOpacity(.1),
                  border: InputBorder.none,
                  errorText: state.enginNumber.displayError != null
                      ? 'Invalide'
                      : null,
                ),
                // validator: (nom) => nom!.isEmpty ? 'Entrez votre nom' : null,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _PlacesNumberInput extends StatelessWidget {
  const _PlacesNumberInput();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Nombre de Place",
              style: TextStyle(fontWeight: FontWeight.bold)),
          BlocBuilder<VehicleBloc, VehicleState>(
            buildWhen: (previous, current) =>
                previous.placesNumber != current.placesNumber,
            builder: (context, state) {
              return TextFormField(
                onChanged: (value) => context
                    .read<VehicleBloc>()
                    .add(VehiclePlacesNumberChanged(placesNumber: value)),
                decoration: InputDecoration(
                  hintText: "01",
                  filled: true,
                  fillColor: Colors.green.withOpacity(.1),
                  border: InputBorder.none,
                  errorText: state.placesNumber.displayError != null
                      ? 'Invalide'
                      : null,
                ),
                // validator: (nom) => nom!.isEmpty ? 'Entrez votre nom' : null,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _PhotosInput extends StatelessWidget {
  const _PhotosInput();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Photos du Véhicule",
              style: TextStyle(fontWeight: FontWeight.bold)),
          BlocBuilder<VehicleBloc, VehicleState>(
            buildWhen: (previous, current) => previous.photos != current.photos,
            builder: (context, state) {
              return TextFormField(
                onChanged: (value) => context
                    .read<VehicleBloc>()
                    .add(VehiclePhotosChanged(photos: value)),
                decoration: InputDecoration(
                  hintText: "TOYOTA",
                  filled: true,
                  fillColor: Colors.green.withOpacity(.1),
                  border: InputBorder.none,
                  errorText:
                      state.photos.displayError != null ? 'Invalide' : null,
                ),
                // validator: (nom) => nom!.isEmpty ? 'Entrez votre nom' : null,
              );
            },
          ),
        ],
      ),
    );
  }
}
