# frozen_string_literal: true

User.create(
  email: 'user@example.com',
  nickname: 'UOne',
  name: 'User One',
  password: 'monkey67'
)

Discipline.create(
  name: 'Physical Therapy',
  field: 'Physical Therapy',
  job_title: 'Physical Therapist',
  abbreviation: 'PT'
)

Discipline.create(
  name: 'Physical Therapy',
  field: 'Physical Therapy Assistance',
  job_title: 'Physical Therapist Assistant',
  abbreviation: 'PTA'
)

Discipline.create(
  name: 'Occupational Therapy',
  field: 'Occupational Therapy',
  job_title: 'Occupational Therapist',
  abbreviation: 'OT'
)

Discipline.create(
  name: 'Occupational Therapy',
  field: 'Certified Occupational Therapy Assistance',
  job_title: 'Certified Occupational Therapy Assistant',
  abbreviation: 'COTA'
)

Discipline.create(
  name: 'Speech-Language Pathology',
  field: 'Speech-Language Pathology',
  job_title: 'Speech-Langugage Pathologist',
  abbreviation: 'SLP'
)

Discipline.create(
  name: 'Skilled Nursing',
  field: 'Skilled Nursing',
  job_title: 'Registered Nurse',
  abbreviation: 'RN'
)
