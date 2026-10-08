import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  // Personal Information
  final TextEditingController nameController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController sexController = TextEditingController();
  final TextEditingController civilStatusController = TextEditingController();
  final TextEditingController nationalityController = TextEditingController();

  // Contact Information
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  // Educational Background
  final TextEditingController courseController = TextEditingController();
  final TextEditingController sectionController = TextEditingController();
  final TextEditingController schoolController = TextEditingController();
  final TextEditingController educationController = TextEditingController();

  // Family Information
  final TextEditingController fatherNameController = TextEditingController();
  final TextEditingController motherNameController = TextEditingController();

  // Emergency Contact
  final TextEditingController emergencyNameController =
      TextEditingController();
  final TextEditingController emergencyNumberController =
      TextEditingController();
  final TextEditingController emergencyRelationshipController =
      TextEditingController();

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> saveData() async {
    if (nameController.text.trim().isEmpty ||
        birthDateController.text.trim().isEmpty ||
        ageController.text.trim().isEmpty ||
        sexController.text.trim().isEmpty ||
        civilStatusController.text.trim().isEmpty ||
        nationalityController.text.trim().isEmpty ||
        addressController.text.trim().isEmpty ||
        phoneController.text.trim().isEmpty ||
        emailController.text.trim().isEmpty ||
        courseController.text.trim().isEmpty ||
        sectionController.text.trim().isEmpty ||
        schoolController.text.trim().isEmpty ||
        educationController.text.trim().isEmpty ||
        fatherNameController.text.trim().isEmpty ||
        motherNameController.text.trim().isEmpty ||
        emergencyNameController.text.trim().isEmpty ||
        emergencyNumberController.text.trim().isEmpty ||
        emergencyRelationshipController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all fields'),
        ),
      );
      return;
    }

    await firestore.collection('FlutterBiodata2').add({
      'name': nameController.text.trim(),
      'birthDate': birthDateController.text.trim(),
      'age': ageController.text.trim(),
      'sex': sexController.text.trim(),
      'civilStatus': civilStatusController.text.trim(),
      'nationality': nationalityController.text.trim(),

      'address': addressController.text.trim(),
      'phone': phoneController.text.trim(),
      'email': emailController.text.trim(),

      'course': courseController.text.trim(),
      'section': sectionController.text.trim(),
      'school': schoolController.text.trim(),
      'educationalAttainment': educationController.text.trim(),

      'fatherName': fatherNameController.text.trim(),
      'motherName': motherNameController.text.trim(),

      'emergencyName': emergencyNameController.text.trim(),
      'emergencyNumber': emergencyNumberController.text.trim(),
      'emergencyRelationship':
          emergencyRelationshipController.text.trim(),

      'createdAt': FieldValue.serverTimestamp(),
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Biodata saved successfully'),
      ),
    );

    nameController.clear();
    birthDateController.clear();
    ageController.clear();
    sexController.clear();
    civilStatusController.clear();
    nationalityController.clear();

    addressController.clear();
    phoneController.clear();
    emailController.clear();

    courseController.clear();
    sectionController.clear();
    schoolController.clear();
    educationController.clear();

    fatherNameController.clear();
    motherNameController.clear();

    emergencyNameController.clear();
    emergencyNumberController.clear();
    emergencyRelationshipController.clear();
  }

  @override
  void dispose() {
    nameController.dispose();
    birthDateController.dispose();
    ageController.dispose();
    sexController.dispose();
    civilStatusController.dispose();
    nationalityController.dispose();

    addressController.dispose();
    phoneController.dispose();
    emailController.dispose();

    courseController.dispose();
    sectionController.dispose();
    schoolController.dispose();
    educationController.dispose();

    fatherNameController.dispose();
    motherNameController.dispose();

    emergencyNameController.dispose();
    emergencyNumberController.dispose();
    emergencyRelationshipController.dispose();

    super.dispose();
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String label,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }

  Widget buildSection({
    required String title,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 15),
        ...children,
        const SizedBox(height: 25),
      ],
    );
  }

  Widget fieldSpacing() {
    return const SizedBox(height: 15);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Light blue background
      backgroundColor: Colors.lightBlue[50],

      appBar: AppBar(
        title: const Text('Biodata Form'),
        backgroundColor: Colors.lightBlue,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Student Biodata',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              'Please provide your information below.',
              style: TextStyle(
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 25),

            // PERSONAL INFORMATION
            buildSection(
              title: 'Personal Information',
              children: [
                buildTextField(
                  controller: nameController,
                  label: 'Full Name',
                ),
                fieldSpacing(),

                buildTextField(
                  controller: birthDateController,
                  label: 'Date of Birth',
                ),
                fieldSpacing(),

                buildTextField(
                  controller: ageController,
                  label: 'Age',
                  keyboardType: TextInputType.number,
                ),
                fieldSpacing(),

                buildTextField(
                  controller: sexController,
                  label: 'Sex',
                ),
                fieldSpacing(),

                buildTextField(
                  controller: civilStatusController,
                  label: 'Civil Status',
                ),
                fieldSpacing(),

                buildTextField(
                  controller: nationalityController,
                  label: 'Nationality',
                ),
              ],
            ),

            // CONTACT INFORMATION
            buildSection(
              title: 'Contact Information',
              children: [
                buildTextField(
                  controller: addressController,
                  label: 'Address',
                ),
                fieldSpacing(),

                buildTextField(
                  controller: phoneController,
                  label: 'Phone Number',
                  keyboardType: TextInputType.phone,
                ),
                fieldSpacing(),

                buildTextField(
                  controller: emailController,
                  label: 'Email',
                  keyboardType: TextInputType.emailAddress,
                ),
              ],
            ),

            // EDUCATIONAL BACKGROUND
            buildSection(
              title: 'Educational Background',
              children: [
                buildTextField(
                  controller: courseController,
                  label: 'Course',
                ),
                fieldSpacing(),

                buildTextField(
                  controller: sectionController,
                  label: 'Section',
                ),
                fieldSpacing(),

                buildTextField(
                  controller: schoolController,
                  label: 'School',
                ),
                fieldSpacing(),

                buildTextField(
                  controller: educationController,
                  label: 'Educational Attainment',
                ),
              ],
            ),

            // FAMILY INFORMATION
            buildSection(
              title: 'Family Information',
              children: [
                buildTextField(
                  controller: fatherNameController,
                  label: "Father's Name",
                ),
                fieldSpacing(),

                buildTextField(
                  controller: motherNameController,
                  label: "Mother's Name",
                ),
              ],
            ),

            // EMERGENCY CONTACT
            buildSection(
              title: 'Emergency Contact',
              children: [
                buildTextField(
                  controller: emergencyNameController,
                  label: 'Emergency Contact Name',
                ),
                fieldSpacing(),

                buildTextField(
                  controller: emergencyNumberController,
                  label: 'Emergency Contact Number',
                  keyboardType: TextInputType.phone,
                ),
                fieldSpacing(),

                buildTextField(
                  controller: emergencyRelationshipController,
                  label: 'Relationship',
                ),
              ],
            ),

            // SAVE BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: saveData,
                child: const Text('Save to Firebase'),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}