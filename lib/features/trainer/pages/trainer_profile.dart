import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lms_adv/core/bloc/exports.dart';
import 'package:lms_adv/core/route/route_name.dart';
import 'package:lms_adv/features/trainer/bloc/trainer_profile/trainer_profile_bloc.dart';

class TrainerProfile extends StatefulWidget {
  const TrainerProfile({super.key});

  @override
  State<TrainerProfile> createState() => _TrainerProfileState();
}

class _TrainerProfileState extends State<TrainerProfile> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<TrainerProfileBloc>().add(TrainerProfileEvent.profile());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            tooltip: "Create Course",
            onPressed: () {
              context.pushNamed(RouteName.createCourse);
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: BlocBuilder<TrainerProfileBloc, TrainerProfileState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () {
              return const Center(child: CircularProgressIndicator());
            },

            failure: (msg) {
              return Center(child: Text(msg.toString()));
            },

            loaded: (trainerProfileModel) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          const CircleAvatar(
                            radius: 50,
                            child: Icon(Icons.person, size: 50),
                          ),

                          const SizedBox(height: 12),

                          Text(
                            trainerProfileModel.profile.name,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 4),

                          Text(
                            "@${trainerProfileModel.profile.username}",
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    const Text(
                      "Basic Information",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            _buildInfoRow(
                              "Email",
                              trainerProfileModel.profile.email,
                            ),

                            _buildInfoRow(
                              "Roles",
                              trainerProfileModel.profile.roles.join(", "),
                            ),

                            _buildInfoRow(
                              "Has Profile",
                              trainerProfileModel.profile.hastrainerprofile
                                  ? "Yes"
                                  : "No",
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      "Trainer Details",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            _buildInfoRow(
                              "Expertise",
                              trainerProfileModel.expertise,
                            ),

                            _buildInfoRow(
                              "Experience",
                              "${trainerProfileModel.experienceYears} Years",
                            ),

                            _buildInfoRow("Bio", trainerProfileModel.bio),
                          ],
                        ),
                      ),
                    ),

                    if (trainerProfileModel.review != null) ...[
                      const SizedBox(height: 20),

                      const Text(
                        "Review Information",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 12),

                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              _buildInfoRow(
                                "Status",
                                trainerProfileModel.review!.status,
                              ),

                              _buildInfoRow(
                                "Rejection Reason",
                                trainerProfileModel
                                        .review!
                                        .rejectionReason
                                        .isEmpty
                                    ? "N/A"
                                    : trainerProfileModel
                                          .review!
                                          .rejectionReason,
                              ),

                              _buildInfoRow(
                                "Reviewed At",
                                trainerProfileModel.review!.reviewedAt
                                    .toString(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],

                    if (trainerProfileModel.suspension != null) ...[
                      const SizedBox(height: 20),

                      const Text(
                        "Suspension Information",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 12),

                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              _buildInfoRow(
                                "Suspended",
                                trainerProfileModel.suspension!.isSuspended
                                    ? "Yes"
                                    : "No",
                              ),

                              _buildInfoRow(
                                "Reason",
                                trainerProfileModel.suspension!.reason.isEmpty
                                    ? "N/A"
                                    : trainerProfileModel.suspension!.reason,
                              ),

                              _buildInfoRow(
                                "Suspended At",
                                trainerProfileModel.suspension!.suspendedAt
                                    .toString(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(flex: 5, child: Text(value)),
        ],
      ),
    );
  }
}
