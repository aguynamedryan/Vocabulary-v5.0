-- Fix names of mapping relationships
update concept set concept_name = 'Mapping relationship to Standard Concept (OMOP)' where concept_id = 44818977;
update concept set concept_name = 'Mapping relationship from Standard Concept (OMOP)' where concept_id = 44818976;
/*
-- start new sequence
drop sequence v5_concept;
DECLARE
 ex NUMBER;
BEGIN
  SELECT MAX(concept_id)+1 INTO ex FROM concept WHERE concept_id<500000000; -- Last valid below HOI concept_id
  BEGIN
    EXECUTE IMMEDIATE 'CREATE SEQUENCE v5_concept INCREMENT BY 1 START WITH ' || ex || ' NOCYCLE CACHE 20 NOORDER';
    EXCEPTION
      WHEN OTHERS THEN NULL;
  END;
END;
*/

-- Add another Observation Period type for Rimma
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Period of complete data capture based on geographic isolation', 'Obs Period Type', 'Obs Period Type', 'Obs Period Type', 'S', 'OMOP generated', '01-JAN-70', '31-DEC-99', null);

-- Remove relationships to domains
delete from concept_relationship where relationship_id in ('Is domain','Domain subsumes');

-- Remove PCORNet concepts that are deprecated
delete from concept where vocabulary_id='PCORNet' and invalid_reason is not null;

-- Fix PCORNet concept_codes
update concept set concept_code='Generic-OT' where concept_id=44814649;
update concept set concept_code='Generic-NI' where concept_id=44814650;
update concept set concept_code='Generic-UN' where concept_id=44814653;
update concept set concept_code='Biobank Flag-Y' where concept_id=44814647;
update concept set concept_code='Biobank Flag-N' where concept_id=44814648;
update concept set concept_code='Hispanic-Y' where concept_id=44814651;
update concept set concept_code='Hispanic-N' where concept_id=44814652;
update concept set concept_code='Race-01' where concept_id=44814654;
update concept set concept_code='Race-02' where concept_id=44814655;
update concept set concept_code='Race-03' where concept_id=44814656;
update concept set concept_code='Race-04' where concept_id=44814657;
update concept set concept_code='Race-05' where concept_id=44814658;
update concept set concept_code='Race-06' where concept_id=44814659;
update concept set concept_code='Race-07' where concept_id=44814660;
update concept set concept_code='Sex-A' where concept_id=44814664;
update concept set concept_code='Sex-F' where concept_id=44814665;
update concept set concept_code='Sex-M' where concept_id=44814666;
update concept set concept_code='Admitting Source-AF' where concept_id=44814670;
update concept set concept_code='Admitting Source-AL' where concept_id=44814671;
update concept set concept_code='Admitting Source-AV' where concept_id=44814672;
update concept set concept_code='Admitting Source-ED' where concept_id=44814673;
update concept set concept_code='Admitting Source-HH' where concept_id=44814674;
update concept set concept_code='Admitting Source-HO' where concept_id=44814675;
update concept set concept_code='Admitting Source-HS' where concept_id=44814676;
update concept set concept_code='Admitting Source-IP' where concept_id=44814677;
update concept set concept_code='Admitting Source-NH' where concept_id=44814678;
update concept set concept_code='Admitting Source-RH' where concept_id=44814679;
update concept set concept_code='Admitting Source-RS' where concept_id=44814680;
update concept set concept_code='Admitting Source-SN' where concept_id=44814681;
update concept set concept_code='Discharge Disposition-A' where concept_id=44814685;
update concept set concept_code='Discharge Disposition-E' where concept_id=44814686;
update concept set concept_code='Discharge Status-AF' where concept_id=44814690;
update concept set concept_code='Discharge Status-AL' where concept_id=44814691;
update concept set concept_code='Discharge Status-AM' where concept_id=44814692;
update concept set concept_code='Discharge Status-AW' where concept_id=44814693;
update concept set concept_code='Discharge Status-E' where concept_id=44814694;
update concept set concept_code='Discharge Status-HH' where concept_id=44814695;
update concept set concept_code='Discharge Status-HO' where concept_id=44814696;
update concept set concept_code='Discharge Status-HS' where concept_id=44814697;
update concept set concept_code='Discharge Status-IP' where concept_id=44814698;
update concept set concept_code='Discharge Status-NH' where concept_id=44814699;
update concept set concept_code='Discharge Status-RH' where concept_id=44814700;
update concept set concept_code='Discharge Status-RS' where concept_id=44814701;
update concept set concept_code='Discharge Status-SH' where concept_id=44814702;
update concept set concept_code='Discharge Status-SN' where concept_id=44814703;
update concept set concept_code='Encounter Type-IP' where concept_id=44814707;
update concept set concept_code='Encounter Type-AV' where concept_id=44814708;
update concept set concept_code='Encounter Type-ED' where concept_id=44814709;
update concept set concept_code='Encounter Type-IS' where concept_id=44814710;
update concept set concept_code='Encounter Type-OA' where concept_id=44814711;
update concept set concept_code='Chart Availability-Y' where concept_id=44814715;
update concept set concept_code='Chart Availability-N' where concept_id=44814716;
update concept set concept_code='Enrollment Basis-I' where concept_id=44814717;
update concept set concept_code='Enrollment Basis-G' where concept_id=44814718;
update concept set concept_code='Enrollment Basis-A' where concept_id=44814719;
update concept set concept_code='Enrollment Basis-E' where concept_id=44814720;
update concept set concept_code='DRG Type-01' where concept_id=44819189;
update concept set concept_code='DRG Type-02' where concept_id=44819190;
update concept set concept_code='Diagnosis Code Type-09' where concept_id=44819194;
update concept set concept_code='Diagnosis Code Type-10' where concept_id=44819195;
update concept set concept_code='Diagnosis Code Type-11' where concept_id=44819196;
update concept set concept_code='Diagnosis Code Type-SM' where concept_id=44819197;
update concept set concept_code='Diagnosis Type-P' where concept_id=44819201;
update concept set concept_code='Diagnosis Type-S' where concept_id=44819202;
update concept set concept_code='Diagnosis Type-X' where concept_id=44819203;
update concept set concept_code='Procedure Code Type-09' where concept_id=44819207;
update concept set concept_code='Procedure Code Type-10' where concept_id=44819208;
update concept set concept_code='Procedure Code Type-11' where concept_id=44819209;
update concept set concept_code='Procedure Code Type-C2' where concept_id=44819210;
update concept set concept_code='Procedure Code Type-C3' where concept_id=44819211;
update concept set concept_code='Procedure Code Type-C4' where concept_id=44819212;
update concept set concept_code='Procedure Code Type-H3' where concept_id=44819213;
update concept set concept_code='Procedure Code Type-HC' where concept_id=44819214;
update concept set concept_code='Procedure Code Type-LC' where concept_id=44819215;
update concept set concept_code='Procedure Code Type-ND' where concept_id=44819216;
update concept set concept_code='Procedure Code Type-RE' where concept_id=44819217;
update concept set concept_code='Vital Source-PR' where concept_id=44819221;
update concept set concept_code='Vital Source-HC' where concept_id=44819222;
update concept set concept_code='Blood Pressure Position-01' where concept_id=44819226;
update concept set concept_code='Blood Pressure Position-02' where concept_id=44819227;
update concept set concept_code='Blood Pressure Position-03' where concept_id=44819228;

-- Add PCORNet mapping
-- Maps to
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814693, 4137274, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814670, 4145666, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814690, 4137274, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814692, 4137274, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814664, 0, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814672, 9202, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814708, 4145666, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814654, 8657, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814655, 8515, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814671, 4145666, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814691, 4137274, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814647, 4001345, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814656, 8516, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814715, 4030450, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814716, 4030450, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814685, 44813951, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814673, 4145666, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814709, 9203, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814718, 44814723, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814717, 44814722, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814720, 44814724, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814719, 44814725, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814686, 44813951, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814694, 4137274, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814665, 8532, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814651, 38003563, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814675, 4145666, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814696, 4137274, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814674, 4145666, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814695, 4137274, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814676, 4145666, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814697, 4137274, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814707, 9201, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814666, 8507, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814659, 0, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814657, 8557, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814650, 0, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814710, 42898160, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814652, 38003564, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814678, 4145666, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814699, 4137274, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814649, 0, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814677, 4145666, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814698, 4137274, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814711, 0, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814660, 0, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814679, 4145666, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814700, 4137274, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814680, 4145666, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814701, 4137274, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814681, 4145666, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814703, 4137274, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814702, 4137274, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44819203, 0, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814648, 4001345, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814653, 4145666, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814658, 8527, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);

-- Maps from
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814693, 4137274, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814670, 4145666, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814690, 4137274, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814692, 4137274, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814664, 0, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814672, 9202, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814708, 4145666, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814654, 8657, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814655, 8515, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814671, 4145666, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814691, 4137274, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814647, 4001345, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814656, 8516, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814715, 4030450, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814716, 4030450, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814685, 44813951, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814673, 4145666, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814709, 9203, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814718, 44814723, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814717, 44814722, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814720, 44814724, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814719, 44814725, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814686, 44813951, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814694, 4137274, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814665, 8532, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814651, 38003563, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814675, 4145666, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814696, 4137274, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814674, 4145666, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814695, 4137274, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814676, 4145666, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814697, 4137274, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814707, 9201, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814666, 8507, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814659, 0, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814657, 8557, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814650, 0, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814710, 42898160, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814652, 38003564, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814678, 4145666, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814699, 4137274, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814649, 0, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814677, 4145666, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814698, 4137274, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814711, 0, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814660, 0, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814679, 4145666, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814700, 4137274, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814680, 4145666, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814701, 4137274, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814681, 4145666, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814703, 4137274, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814702, 4137274, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44819203, 0, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814648, 4001345, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814653, 4145666, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814658, 8527, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);

-- Maps to value
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814693, 44814693, 'Maps to value', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814670, 38004205, 'Maps to value', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814690, 38004205, 'Maps to value', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814692, 4021968, 'Maps to value', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814708, 38004207, 'Maps to value', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814671, 38004301, 'Maps to value', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814691, 38004301, 'Maps to value', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814647, 4188539, 'Maps to value', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814715, 4188539, 'Maps to value', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814716, 4188540, 'Maps to value', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814685, 4161979, 'Maps to value', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814673, 8870, 'Maps to value', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814686, 4216643, 'Maps to value', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814694, 4216643, 'Maps to value', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814675, 8536, 'Maps to value', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814696, 8536, 'Maps to value', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814674, 38004195, 'Maps to value', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814695, 38004195, 'Maps to value', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814676, 8546, 'Maps to value', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814697, 8546, 'Maps to value', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814678, 8676, 'Maps to value', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814699, 8676, 'Maps to value', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814677, 38004279, 'Maps to value', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814698, 38004279, 'Maps to value', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814679, 8920, 'Maps to value', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814700, 8920, 'Maps to value', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814680, 44814680, 'Maps to value', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814701, 44814701, 'Maps to value', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814681, 8863, 'Maps to value', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814703, 8863, 'Maps to value', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814702, 8717, 'Maps to value', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814648, 4188540, 'Maps to value', '01-Jan-1970', '31-Dec-2099', null);

-- Value mapped from
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814693, 44814693, 'Value mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814670, 38004205, 'Value mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814690, 38004205, 'Value mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814692, 4021968, 'Value mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814708, 38004207, 'Value mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814671, 38004301, 'Value mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814691, 38004301, 'Value mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814647, 4188539, 'Value mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814715, 4188539, 'Value mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814716, 4188540, 'Value mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814685, 4161979, 'Value mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814673, 8870, 'Value mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814686, 4216643, 'Value mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814694, 4216643, 'Value mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814675, 8536, 'Value mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814696, 8536, 'Value mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814674, 38004195, 'Value mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814695, 38004195, 'Value mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814676, 8546, 'Value mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814697, 8546, 'Value mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814678, 8676, 'Value mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814699, 8676, 'Value mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814677, 38004279, 'Value mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814698, 38004279, 'Value mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814679, 8920, 'Value mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814700, 8920, 'Value mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814680, 44814680, 'Value mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814701, 44814701, 'Value mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814681, 8863, 'Value mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814703, 8863, 'Value mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814702, 8717, 'Value mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values (44814648, 4188540, 'Value mapped from', '01-Jan-1970', '31-Dec-2099', null);

-- Restore vocabulary_conversion table for use in download page
alter table vocabulary_conversion add url varchar2(256);
alter table vocabulary_conversion add click_disabled varchar(1);
-- Put mailto links where a commercial license is required (except CPT4 and MedDRA)
update vocabulary_conversion 
  set url='mailto:contact@ohdsi.org?subject=License%20required%20for%20'||vocabulary_id_v5|| chr(38) ||'body=Describe%20your%20situation%20and%20your%20need%20for%20this%20vocabulary.' 
where vocabulary_id_v5 in ('GPI', 'Indication', 'ETC', 'Multilex');
-- Disallow switching on commercial vocabularies (except CTP4 and MedDRA)
update vocabulary_conversion set click_disabled='Y' where vocabulary_id_v5 in ('GPI', 'Indication', 'ETC', 'Multilex', 'ICD10CM');
-- Disallow removing type and metadata concepts
update vocabulary_conversion set click_disabled='Y' where vocabulary_id_v4 in (12, 24, 33, 44, 59, 66, 67, 68);
-- Indicate license requirement for commercial vocabularies (except CPT4 and MedDRA)
update vocabulary_conversion set available='License required' where vocabulary_id_v5 in ('GPI', 'Indication', 'ETC', 'Multilex');
-- Link to new EULA page for CPT4 and MedDRA
update vocabulary_conversion set url='http://www.ohdsi.org/standardized-vocabulary-eula/' where vocabulary_id_v5 in ('CPT4', 'MedDRA');
-- Indicate EULA requirement for CTP4 and MedDRA
update vocabulary_conversion set available='EULA required' where vocabulary_id_v5 in ('CPT4', 'MedDRA');

-- add UCUM equivalents to SNOMED UK units used in drug extension
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Million unit per liter', 'Unit', 'UCUM', 'Unit', 'S', '10*6.[U]/mL', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'gram per dose', 'Unit', 'UCUM', 'Unit', 'S', 'g/[dose]', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'milligram per dose', 'Unit', 'UCUM', 'Unit', 'S', 'mg/[dose]', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'microgram per dose', 'Unit', 'UCUM', 'Unit', 'S', 'ug/[dose]', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'unit per dose', 'Unit', 'UCUM', 'Unit', 'S', '[U]/[dose]', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'application', 'Unit', 'UCUM', 'Unit', 'S', '[App]', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'gram per application', 'Unit', 'UCUM', 'Unit', 'S', 'g/[App]', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'milligram per application', 'Unit', 'UCUM', 'Unit', 'S', 'mg/[App]', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'tuberculin unit per milliliter', 'Unit', 'UCUM', 'Unit', 'S', '[tb''U]/mL', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'month supply', 'Unit', 'UCUM', 'Unit', 'S', 'mo{supply}', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'week supply', 'Unit', 'UCUM', 'Unit', 'S', 'wk{supply}', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'unit per drop', 'Unit', 'UCUM', 'Unit', 'S', '[U]/[drop]', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Megabecquerel', 'Unit', 'UCUM', 'Unit', 'S', 'MBq', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'kilobecquerel', 'Unit', 'UCUM', 'Unit', 'S', 'kBq', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'weight percent volume', 'Unit', 'UCUM', 'Unit', 'S', '{wt]%{vol]', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'volume percent volume', 'Unit', 'UCUM', 'Unit', 'S', '{vol}%{vol}', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'weight percent weight', 'Unit', 'UCUM', 'Unit', 'S', '{wt}%{wt}', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'volume percent weight', 'Unit', 'UCUM', 'Unit', 'S', '{vol}%{wt}', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'milliliter per liter', 'Unit', 'UCUM', 'Unit', 'S', 'mL/L', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'millimole per milliliter', 'Unit', 'UCUM', 'Unit', 'S', 'mmol/mL', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'microgram per actuation', 'Unit', 'UCUM', 'Unit', 'S', 'ug/{actuat}', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'milligram per actuation', 'Unit', 'UCUM', 'Unit', 'S', 'mg/{actuat}', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'unit per actuation', 'Unit', 'UCUM', 'Unit', 'S', '[U]/{actuat}', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'gram per actuation', 'Unit', 'UCUM', 'Unit', 'S', 'g/{actuat}', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'international unit per milligram', 'Unit', 'UCUM', 'Unit', 'S', '[iU]/mg', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'megaunit', 'Unit', 'UCUM', 'Unit', 'S', '10*6.[U]', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'milligram per 16 hours', 'Unit', 'UCUM', 'Unit', 'S', 'mg/(16.h)', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'milligram per 72 hours', 'Unit', 'UCUM', 'Unit', 'S', 'mg/(72.h)', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'microgram per 72 hours', 'Unit', 'UCUM', 'Unit', 'S', 'ug/(72.h)', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Kallikrein inactivator unit', 'Unit', 'UCUM', 'Unit', 'S', '{KIU}', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'nanoliter per milliliter', 'Unit', 'UCUM', 'Unit', 'S', 'nL/mL', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Kallikrein inactivator unit per milliliter', 'Unit', 'UCUM', 'Unit', 'S', '{KIU]/mL', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'microgram per square centimeter', 'Unit', 'UCUM', 'Unit', 'S', 'ug/cm2', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Gigabecquerel per milliliter', 'Unit', 'UCUM', 'Unit', 'S', 'GBq/mL', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'microliter per milliliter', 'Unit', 'UCUM', 'Unit', 'S', 'uL/mL', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'unit per milligram', 'Unit', 'UCUM', 'Unit', 'S', '[U]/mg', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Gigabecquerel', 'Unit', 'UCUM', 'Unit', 'S', 'GBq', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'Megabecquerel per milliliter', 'Unit', 'UCUM', 'Unit', 'S', 'MBq/mL', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'milliliter per milliliter', 'Unit', 'UCUM', 'Unit', 'S', 'mL/mL', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'unit per square centimeter', 'Unit', 'UCUM', 'Unit', 'S', '[U]/cm2', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'milliliter per gram', 'Unit', 'UCUM', 'Unit', 'S', 'mL/g', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'milligram per square centimeter', 'Unit', 'UCUM', 'Unit', 'S', 'mg/cm2', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'microliter per gram', 'Unit', 'UCUM', 'Unit', 'S', 'uL/g', '01-JAN-1970', '31-DEC-2099', null);
insert into concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason)
values (v5_concept.nextval, 'kilobecquerel per milliliter', 'Unit', 'UCUM', 'Unit', 'S', 'kBq/mL', '01-JAN-1970', '31-DEC-2099', null);

-- Add mappings from SNOMED to UCUM
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '10368511000001103' and vocabulary_id = 'SNOMED'
), 45890995, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '10691711000001108' and vocabulary_id = 'SNOMED'
), 45890996, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '10691811000001100' and vocabulary_id = 'SNOMED'
), 45890997, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '10691911000001105' and vocabulary_id = 'SNOMED'
), 45890998, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '10692011000001103' and vocabulary_id = 'SNOMED'
), 45890999, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '10692211000001108' and vocabulary_id = 'SNOMED'
), 45891000, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '10692311000001100' and vocabulary_id = 'SNOMED'
), 45891001, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '10692411000001107' and vocabulary_id = 'SNOMED'
), 45891002, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '10692511000001106' and vocabulary_id = 'SNOMED'
), 45891003, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '10692711000001101' and vocabulary_id = 'SNOMED'
), 9510, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '10692811000001109' and vocabulary_id = 'SNOMED'
), 45891004, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '10692911000001104' and vocabulary_id = 'SNOMED'
), 45891005, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '10693311000001105' and vocabulary_id = 'SNOMED'
), 8784, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '10693711000001109' and vocabulary_id = 'SNOMED'
), 45891006, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '229034000' and vocabulary_id = 'SNOMED'
), 45891007, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '258669008' and vocabulary_id = 'SNOMED'
), 9546, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '258672001' and vocabulary_id = 'SNOMED'
), 8582, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '258673006' and vocabulary_id = 'SNOMED'
), 8588, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '258682000' and vocabulary_id = 'SNOMED'
), 8504, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '258683005' and vocabulary_id = 'SNOMED'
), 9529, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '258684004' and vocabulary_id = 'SNOMED'
), 8576, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '258685003' and vocabulary_id = 'SNOMED'
), 9655, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '258686002' and vocabulary_id = 'SNOMED'
), 9600, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '258702006' and vocabulary_id = 'SNOMED'
), 8505, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '258718000' and vocabulary_id = 'SNOMED'
), 9573, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '258719008' and vocabulary_id = 'SNOMED'
), 9667, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '258731005' and vocabulary_id = 'SNOMED'
), 9241, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '258770004' and vocabulary_id = 'SNOMED'
), 8519, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '258773002' and vocabulary_id = 'SNOMED'
), 8587, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '258774008' and vocabulary_id = 'SNOMED'
), 9665, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '258794004' and vocabulary_id = 'SNOMED'
), 8636, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '258796002' and vocabulary_id = 'SNOMED'
), 8751, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '258798001' and vocabulary_id = 'SNOMED'
), 8861, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '258801007' and vocabulary_id = 'SNOMED'
), 8859, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '258802000' and vocabulary_id = 'SNOMED'
), 8720, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '258806002' and vocabulary_id = 'SNOMED'
), 8842, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '258812007' and vocabulary_id = 'SNOMED'
), 9586, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '258813002' and vocabulary_id = 'SNOMED'
), 8736, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '258836006' and vocabulary_id = 'SNOMED'
), 8909, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '258838007' and vocabulary_id = 'SNOMED'
), 44777645, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '258840002' and vocabulary_id = 'SNOMED'
), 8906, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '258948008' and vocabulary_id = 'SNOMED'
), 8763, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '258997004' and vocabulary_id = 'SNOMED'
), 8718, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '259002007' and vocabulary_id = 'SNOMED'
), 8985, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '259022006' and vocabulary_id = 'SNOMED'
), 9483, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '282113003' and vocabulary_id = 'SNOMED'
), 9606, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '282143001' and vocabulary_id = 'SNOMED'
), 45891008, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '282379003' and vocabulary_id = 'SNOMED'
), 45891009, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '282380000' and vocabulary_id = 'SNOMED'
), 45891010, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '3314211000001106' and vocabulary_id = 'SNOMED'
), 0, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '3314511000001109' and vocabulary_id = 'SNOMED'
), 45891011, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '3314611000001108' and vocabulary_id = 'SNOMED'
), 45891012, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '3315911000001103' and vocabulary_id = 'SNOMED'
), 45891013, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '3316111000001107' and vocabulary_id = 'SNOMED'
), 9586, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '3316211000001101' and vocabulary_id = 'SNOMED'
), 8753, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '3316311000001109' and vocabulary_id = 'SNOMED'
), 45891014, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '3316411000001102' and vocabulary_id = 'SNOMED'
), 8510, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '3319711000001103' and vocabulary_id = 'SNOMED'
), 8510, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '396163008' and vocabulary_id = 'SNOMED'
), 9562, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '396169007' and vocabulary_id = 'SNOMED'
), 9514, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '396180007' and vocabulary_id = 'SNOMED'
), 9571, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '4034511000001102' and vocabulary_id = 'SNOMED'
), 45744809, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '4034811000001104' and vocabulary_id = 'SNOMED'
), 9412, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '408104008' and vocabulary_id = 'SNOMED'
), 45891015, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '408105009' and vocabulary_id = 'SNOMED'
), 45891016, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '408106005' and vocabulary_id = 'SNOMED'
), 45891017, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '408107001' and vocabulary_id = 'SNOMED'
), 45891018, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '408162005' and vocabulary_id = 'SNOMED'
), 9530, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '408163000' and vocabulary_id = 'SNOMED'
), 9333, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '408164006' and vocabulary_id = 'SNOMED'
), 45891019, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '408165007' and vocabulary_id = 'SNOMED'
), 45891020, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '408166008' and vocabulary_id = 'SNOMED'
), 45891021, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '408167004' and vocabulary_id = 'SNOMED'
), 45891022, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '408168009' and vocabulary_id = 'SNOMED'
), 8723, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '408169001' and vocabulary_id = 'SNOMED'
), 9565, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '408170000' and vocabulary_id = 'SNOMED'
), 45891023, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '411225003' and vocabulary_id = 'SNOMED'
), 45891024, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '414719002' and vocabulary_id = 'SNOMED'
), 9673, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '415758003' and vocabulary_id = 'SNOMED'
), 9413, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '415784009' and vocabulary_id = 'SNOMED'
), 8629, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '417932008' and vocabulary_id = 'SNOMED'
), 45891025, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '417962002' and vocabulary_id = 'SNOMED'
), 45891026, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '418042005' and vocabulary_id = 'SNOMED'
), 45891027, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '418261000' and vocabulary_id = 'SNOMED'
), 45891028, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '418342002' and vocabulary_id = 'SNOMED'
), 45891029, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '418830004' and vocabulary_id = 'SNOMED'
), 45891030, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '418931004' and vocabulary_id = 'SNOMED'
), 45891031, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '418948007' and vocabulary_id = 'SNOMED'
), 45891032, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '419346007' and vocabulary_id = 'SNOMED'
), 45891033, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '419691006' and vocabulary_id = 'SNOMED'
), 45891034, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '419805009' and vocabulary_id = 'SNOMED'
), 45891035, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '8083511000001107' and vocabulary_id = 'SNOMED'
), 45891036, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '8088511000001103' and vocabulary_id = 'SNOMED'
), 45891037, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_2, concept_id_1, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '8090811000001104' and vocabulary_id = 'SNOMED'
), 45891038, 'Mapped from', '01-Jan-1970', '31-Dec-2099', null);

insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '10368511000001103' and vocabulary_id = 'SNOMED'
), 45890995, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '10691711000001108' and vocabulary_id = 'SNOMED'
), 45890996, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '10691811000001100' and vocabulary_id = 'SNOMED'
), 45890997, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '10691911000001105' and vocabulary_id = 'SNOMED'
), 45890998, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '10692011000001103' and vocabulary_id = 'SNOMED'
), 45890999, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '10692211000001108' and vocabulary_id = 'SNOMED'
), 45891000, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '10692311000001100' and vocabulary_id = 'SNOMED'
), 45891001, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '10692411000001107' and vocabulary_id = 'SNOMED'
), 45891002, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '10692511000001106' and vocabulary_id = 'SNOMED'
), 45891003, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '10692711000001101' and vocabulary_id = 'SNOMED'
), 9510, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '10692811000001109' and vocabulary_id = 'SNOMED'
), 45891004, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '10692911000001104' and vocabulary_id = 'SNOMED'
), 45891005, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '10693311000001105' and vocabulary_id = 'SNOMED'
), 8784, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '10693711000001109' and vocabulary_id = 'SNOMED'
), 45891006, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '229034000' and vocabulary_id = 'SNOMED'
), 45891007, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '258669008' and vocabulary_id = 'SNOMED'
), 9546, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '258672001' and vocabulary_id = 'SNOMED'
), 8582, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '258673006' and vocabulary_id = 'SNOMED'
), 8588, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '258682000' and vocabulary_id = 'SNOMED'
), 8504, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '258683005' and vocabulary_id = 'SNOMED'
), 9529, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '258684004' and vocabulary_id = 'SNOMED'
), 8576, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '258685003' and vocabulary_id = 'SNOMED'
), 9655, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '258686002' and vocabulary_id = 'SNOMED'
), 9600, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '258702006' and vocabulary_id = 'SNOMED'
), 8505, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '258718000' and vocabulary_id = 'SNOMED'
), 9573, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '258719008' and vocabulary_id = 'SNOMED'
), 9667, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '258731005' and vocabulary_id = 'SNOMED'
), 9241, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '258770004' and vocabulary_id = 'SNOMED'
), 8519, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '258773002' and vocabulary_id = 'SNOMED'
), 8587, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '258774008' and vocabulary_id = 'SNOMED'
), 9665, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '258794004' and vocabulary_id = 'SNOMED'
), 8636, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '258796002' and vocabulary_id = 'SNOMED'
), 8751, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '258798001' and vocabulary_id = 'SNOMED'
), 8861, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '258801007' and vocabulary_id = 'SNOMED'
), 8859, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '258802000' and vocabulary_id = 'SNOMED'
), 8720, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '258806002' and vocabulary_id = 'SNOMED'
), 8842, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '258812007' and vocabulary_id = 'SNOMED'
), 9586, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '258813002' and vocabulary_id = 'SNOMED'
), 8736, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '258836006' and vocabulary_id = 'SNOMED'
), 8909, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '258838007' and vocabulary_id = 'SNOMED'
), 44777645, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '258840002' and vocabulary_id = 'SNOMED'
), 8906, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '258948008' and vocabulary_id = 'SNOMED'
), 8763, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '258997004' and vocabulary_id = 'SNOMED'
), 8718, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '259002007' and vocabulary_id = 'SNOMED'
), 8985, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '259022006' and vocabulary_id = 'SNOMED'
), 9483, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '282113003' and vocabulary_id = 'SNOMED'
), 9606, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '282143001' and vocabulary_id = 'SNOMED'
), 45891008, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '282379003' and vocabulary_id = 'SNOMED'
), 45891009, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '282380000' and vocabulary_id = 'SNOMED'
), 45891010, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '3314211000001106' and vocabulary_id = 'SNOMED'
), 0, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '3314511000001109' and vocabulary_id = 'SNOMED'
), 45891011, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '3314611000001108' and vocabulary_id = 'SNOMED'
), 45891012, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '3315911000001103' and vocabulary_id = 'SNOMED'
), 45891013, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '3316111000001107' and vocabulary_id = 'SNOMED'
), 9586, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '3316211000001101' and vocabulary_id = 'SNOMED'
), 8753, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '3316311000001109' and vocabulary_id = 'SNOMED'
), 45891014, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '3316411000001102' and vocabulary_id = 'SNOMED'
), 8510, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '3319711000001103' and vocabulary_id = 'SNOMED'
), 8510, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '396163008' and vocabulary_id = 'SNOMED'
), 9562, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '396169007' and vocabulary_id = 'SNOMED'
), 9514, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '396180007' and vocabulary_id = 'SNOMED'
), 9571, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '4034511000001102' and vocabulary_id = 'SNOMED'
), 45744809, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '4034811000001104' and vocabulary_id = 'SNOMED'
), 9412, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '408104008' and vocabulary_id = 'SNOMED'
), 45891015, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '408105009' and vocabulary_id = 'SNOMED'
), 45891016, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '408106005' and vocabulary_id = 'SNOMED'
), 45891017, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '408107001' and vocabulary_id = 'SNOMED'
), 45891018, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '408162005' and vocabulary_id = 'SNOMED'
), 9530, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '408163000' and vocabulary_id = 'SNOMED'
), 9333, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '408164006' and vocabulary_id = 'SNOMED'
), 45891019, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '408165007' and vocabulary_id = 'SNOMED'
), 45891020, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '408166008' and vocabulary_id = 'SNOMED'
), 45891021, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '408167004' and vocabulary_id = 'SNOMED'
), 45891022, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '408168009' and vocabulary_id = 'SNOMED'
), 8723, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '408169001' and vocabulary_id = 'SNOMED'
), 9565, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '408170000' and vocabulary_id = 'SNOMED'
), 45891023, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '411225003' and vocabulary_id = 'SNOMED'
), 45891024, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '414719002' and vocabulary_id = 'SNOMED'
), 9673, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '415758003' and vocabulary_id = 'SNOMED'
), 9413, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '415784009' and vocabulary_id = 'SNOMED'
), 8629, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '417932008' and vocabulary_id = 'SNOMED'
), 45891025, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '417962002' and vocabulary_id = 'SNOMED'
), 45891026, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '418042005' and vocabulary_id = 'SNOMED'
), 45891027, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '418261000' and vocabulary_id = 'SNOMED'
), 45891028, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '418342002' and vocabulary_id = 'SNOMED'
), 45891029, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '418830004' and vocabulary_id = 'SNOMED'
), 45891030, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '418931004' and vocabulary_id = 'SNOMED'
), 45891031, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '418948007' and vocabulary_id = 'SNOMED'
), 45891032, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '419346007' and vocabulary_id = 'SNOMED'
), 45891033, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '419691006' and vocabulary_id = 'SNOMED'
), 45891034, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '419805009' and vocabulary_id = 'SNOMED'
), 45891035, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '8083511000001107' and vocabulary_id = 'SNOMED'
), 45891036, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '8088511000001103' and vocabulary_id = 'SNOMED'
), 45891037, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);
insert into concept_relationship (concept_id_1, concept_id_2, relationship_id, valid_start_date, valid_end_date, invalid_reason)
values ((
	select concept_id from concept where concept_code = '8090811000001104' and vocabulary_id = 'SNOMED'
), 45891038, 'Maps to', '01-Jan-1970', '31-Dec-2099', null);

-- Add mappings from upgraded SNOMED Concepts to UCUM
insert into concept_relationship 
select 
  rep.concept_id_1, 
  ucum.concept_id_2,
  'SNOMED replaced by' as relationship_id,
  '01-Jan-1970' as valid_start_date,
  '31-Dec-2099' as valid_end_date,
  null as invalid_reason
from (
  select c1.concept_id as concept_id_1, c2.concept_id as concept_id_2 from concept c1
  join concept_relationship r on r.concept_id_1=c1.concept_id
  join concept c2 on c2.concept_id=r.concept_id_2
  where relationship_id='SNOMED replaced by' 
  and c1.vocabulary_id='SNOMED' and c2.vocabulary_id='SNOMED'
) rep
join (
  select c1.concept_id as concept_id_1, c2.concept_id as concept_id_2 from concept c1
  join concept_relationship r on r.concept_id_1=c1.concept_id
  join concept c2 on c2.concept_id=r.concept_id_2
  where relationship_id='Maps to' 
  and c1.vocabulary_id='SNOMED' and c2.vocabulary_id='UCUM'
) ucum on rep.concept_id_2=ucum.concept_id_1
;

insert into concept_relationship 
select 
  ucum.concept_id_2 as concept_id_1,
  rep.concept_id_1 as concept_id_2, 
  'SNOMED replaces' as relationship_id,
  '01-Jan-1970' as valid_start_date,
  '31-Dec-2099' as valid_end_date,
  null as invalid_reason
from (
  select c1.concept_id as concept_id_1, c2.concept_id as concept_id_2 from concept c1
  join concept_relationship r on r.concept_id_1=c1.concept_id
  join concept c2 on c2.concept_id=r.concept_id_2
  where relationship_id='SNOMED replaced by' 
  and c1.vocabulary_id='SNOMED' and c2.vocabulary_id='SNOMED'
) rep
join (
  select c1.concept_id as concept_id_1, c2.concept_id as concept_id_2 from concept c1
  join concept_relationship r on r.concept_id_1=c1.concept_id
  join concept c2 on c2.concept_id=r.concept_id_2
  where relationship_id='Maps to' 
  and c1.vocabulary_id='SNOMED' and c2.vocabulary_id='UCUM'
) ucum on rep.concept_id_2=ucum.concept_id_1
;

commit;

-- Add SNOMED UK additions to relationship
'Has disp dose form' HAS_DISPENSED_DOSE_FORM
'Has spec active ing' HAS_SPECIFIC_ACTIVE_INGREDIENT
'Has basis str subst' HAS_BASIS_OF_STRENGTH_SUBSTANCE
'Has VMP' HAS_VMP
'Has incipient' HAS_EXCIPIENT
'Has licensed route' Has licensed route
'Has dose form unit' Unit relating to the size
'Has unit of prod use' Unit relating to the entity that can be handled
'Has route' 
'Has AMP' HAS_AMP


commit;




-- Not done yet:
-- Change all relationships containing replaces or replaces by to these. Remove the extra relationships
update concept_relationship set relationship_id = 'Concept replaces' where relationship_id in (
  'LOINC replaces',
  'RxNorm replaces',
  'SNOMED replaces',
  'ICD9P replaces',
  'UCUM replaces'
);
update concept_relationship set relationship_id = 'Concept replaced by' where relationship_id in (
  'LOINC replaced by',
  'RxNorm replaced by',
  'SNOMED replaced by',
  'ICD9P replaced by',
  'UCUM replaced by'
);
update concept set 
  valid_end_date = '10-Jan-2015',
  invalid_reason = 'D'
where concept_id in (
  44818714, -- LOINC replaced by
  44818812, -- LOINC replaces
  44818946, -- RxNorm replaced by
  44818947, -- RxNorm replaces
  44818948, -- SNOMED replaced by
  44818949, -- SNOMED replaces
  44818971, -- ICD9P replaced by
  44818972, -- ICD9P replaces
  44818978, -- UCUM replaced by
  44818979 -- UCUM replaces
);
delete from relationship where relationship_id in (
  'LOINC replaces',
  'RxNorm replaces',
  'SNOMED replaces',
  'ICD9P replaces',
  'UCUM replaces',
  'LOINC replaced by',
  'RxNorm replaced by',
  'SNOMED replaced by',
  'ICD9P replaced by',
  'UCUM replaced by'
);

