--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: otlo; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA otlo;


ALTER SCHEMA otlo OWNER TO postgres;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = otlo, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: action; Type: TABLE; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE TABLE action (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE otlo.action OWNER TO postgres;

--
-- Name: action_id_seq; Type: SEQUENCE; Schema: otlo; Owner: postgres
--

CREATE SEQUENCE action_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE otlo.action_id_seq OWNER TO postgres;

--
-- Name: action_id_seq; Type: SEQUENCE OWNED BY; Schema: otlo; Owner: postgres
--

ALTER SEQUENCE action_id_seq OWNED BY action.id;


--
-- Name: adhoc; Type: TABLE; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE TABLE adhoc (
    id integer NOT NULL,
    company_id integer NOT NULL,
    equipment_id integer NOT NULL,
    event_id integer,
    requested_by integer NOT NULL,
    requested_at timestamp without time zone NOT NULL,
    inspected_by integer,
    adhoc_status_id integer NOT NULL,
    adhoc_type_id integer NOT NULL,
    auxiliary_equipment_id integer,
    auxiliary_equipment_type_id integer,
    created_at timestamp without time zone,
    inspected_at timestamp without time zone,
    image character varying(255),
    comment character varying(256)
);


ALTER TABLE otlo.adhoc OWNER TO postgres;

--
-- Name: adhoc_id_seq; Type: SEQUENCE; Schema: otlo; Owner: postgres
--

CREATE SEQUENCE adhoc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE otlo.adhoc_id_seq OWNER TO postgres;

--
-- Name: adhoc_id_seq; Type: SEQUENCE OWNED BY; Schema: otlo; Owner: postgres
--

ALTER SEQUENCE adhoc_id_seq OWNED BY adhoc.id;


--
-- Name: adhoc_status; Type: TABLE; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE TABLE adhoc_status (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE otlo.adhoc_status OWNER TO postgres;

--
-- Name: adhoc_status_id_seq; Type: SEQUENCE; Schema: otlo; Owner: postgres
--

CREATE SEQUENCE adhoc_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE otlo.adhoc_status_id_seq OWNER TO postgres;

--
-- Name: adhoc_status_id_seq; Type: SEQUENCE OWNED BY; Schema: otlo; Owner: postgres
--

ALTER SEQUENCE adhoc_status_id_seq OWNED BY adhoc_status.id;


--
-- Name: adhoc_type; Type: TABLE; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE TABLE adhoc_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE otlo.adhoc_type OWNER TO postgres;

--
-- Name: adhoc_type_id_seq; Type: SEQUENCE; Schema: otlo; Owner: postgres
--

CREATE SEQUENCE adhoc_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE otlo.adhoc_type_id_seq OWNER TO postgres;

--
-- Name: adhoc_type_id_seq; Type: SEQUENCE OWNED BY; Schema: otlo; Owner: postgres
--

ALTER SEQUENCE adhoc_type_id_seq OWNED BY adhoc_type.id;


--
-- Name: asset_type; Type: TABLE; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE TABLE asset_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE otlo.asset_type OWNER TO postgres;

--
-- Name: asset_type_id_seq; Type: SEQUENCE; Schema: otlo; Owner: postgres
--

CREATE SEQUENCE asset_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE otlo.asset_type_id_seq OWNER TO postgres;

--
-- Name: asset_type_id_seq; Type: SEQUENCE OWNED BY; Schema: otlo; Owner: postgres
--

ALTER SEQUENCE asset_type_id_seq OWNED BY asset_type.id;


--
-- Name: auxiliary_equipment; Type: TABLE; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE TABLE auxiliary_equipment (
    equipment_id integer NOT NULL,
    auxiliary_equipment_id integer NOT NULL
);


ALTER TABLE otlo.auxiliary_equipment OWNER TO postgres;

--
-- Name: business_unit; Type: TABLE; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE TABLE business_unit (
    id integer NOT NULL,
    company_id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE otlo.business_unit OWNER TO postgres;

--
-- Name: business_unit_id_seq; Type: SEQUENCE; Schema: otlo; Owner: postgres
--

CREATE SEQUENCE business_unit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE otlo.business_unit_id_seq OWNER TO postgres;

--
-- Name: business_unit_id_seq; Type: SEQUENCE OWNED BY; Schema: otlo; Owner: postgres
--

ALTER SEQUENCE business_unit_id_seq OWNED BY business_unit.id;


--
-- Name: company; Type: TABLE; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE TABLE company (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    address character varying(128),
    city character varying(100),
    postal character varying(16),
    country character varying(100),
    phone character varying(32),
    email character varying(256),
    created_at timestamp without time zone
);


ALTER TABLE otlo.company OWNER TO postgres;

--
-- Name: company_id_seq; Type: SEQUENCE; Schema: otlo; Owner: postgres
--

CREATE SEQUENCE company_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE otlo.company_id_seq OWNER TO postgres;

--
-- Name: company_id_seq; Type: SEQUENCE OWNED BY; Schema: otlo; Owner: postgres
--

ALTER SEQUENCE company_id_seq OWNED BY company.id;


--
-- Name: company_settings; Type: TABLE; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE TABLE company_settings (
    id integer NOT NULL,
    company_id integer NOT NULL,
    key character varying(100) NOT NULL,
    value character varying(100) NOT NULL
);


ALTER TABLE otlo.company_settings OWNER TO postgres;

--
-- Name: company_settings_id_seq; Type: SEQUENCE; Schema: otlo; Owner: postgres
--

CREATE SEQUENCE company_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE otlo.company_settings_id_seq OWNER TO postgres;

--
-- Name: company_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: otlo; Owner: postgres
--

ALTER SEQUENCE company_settings_id_seq OWNED BY company_settings.id;


--
-- Name: department; Type: TABLE; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE TABLE department (
    id integer NOT NULL,
    company_id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE otlo.department OWNER TO postgres;

--
-- Name: department_id_seq; Type: SEQUENCE; Schema: otlo; Owner: postgres
--

CREATE SEQUENCE department_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE otlo.department_id_seq OWNER TO postgres;

--
-- Name: department_id_seq; Type: SEQUENCE OWNED BY; Schema: otlo; Owner: postgres
--

ALTER SEQUENCE department_id_seq OWNED BY department.id;


--
-- Name: employee; Type: TABLE; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE TABLE employee (
    id integer NOT NULL,
    company_id integer NOT NULL,
    role_id integer,
    department_id integer,
    employee_uid character varying(100) NOT NULL,
    first_name character varying(100),
    last_name character varying(100),
    email character varying(100) NOT NULL,
    password character varying(100) NOT NULL,
    pda_pin smallint,
    last_activity timestamp without time zone,
    phone character varying
);


ALTER TABLE otlo.employee OWNER TO postgres;

--
-- Name: employee_id_seq; Type: SEQUENCE; Schema: otlo; Owner: postgres
--

CREATE SEQUENCE employee_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE otlo.employee_id_seq OWNER TO postgres;

--
-- Name: employee_id_seq; Type: SEQUENCE OWNED BY; Schema: otlo; Owner: postgres
--

ALTER SEQUENCE employee_id_seq OWNED BY employee.id;


--
-- Name: employee_secondary_identifier; Type: TABLE; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE TABLE employee_secondary_identifier (
    id integer NOT NULL,
    employee_id integer NOT NULL,
    name character varying(100) NOT NULL,
    is_nfc boolean DEFAULT true NOT NULL,
    is_qr boolean DEFAULT false NOT NULL
);


ALTER TABLE otlo.employee_secondary_identifier OWNER TO postgres;

--
-- Name: employee_secondary_identifier_id_seq; Type: SEQUENCE; Schema: otlo; Owner: postgres
--

CREATE SEQUENCE employee_secondary_identifier_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE otlo.employee_secondary_identifier_id_seq OWNER TO postgres;

--
-- Name: employee_secondary_identifier_id_seq; Type: SEQUENCE OWNED BY; Schema: otlo; Owner: postgres
--

ALTER SEQUENCE employee_secondary_identifier_id_seq OWNED BY employee_secondary_identifier.id;


--
-- Name: equipment; Type: TABLE; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE TABLE equipment (
    id integer NOT NULL,
    equipment_uid character varying(100) NOT NULL,
    name character varying(100),
    company_id integer NOT NULL,
    photo boolean DEFAULT true NOT NULL,
    audio boolean DEFAULT false NOT NULL,
    is_locked boolean DEFAULT false NOT NULL,
    is_tagged boolean DEFAULT false NOT NULL,
    status_id integer NOT NULL,
    unit_operation_id integer,
    updated_at timestamp without time zone,
    type_id integer NOT NULL,
    auxiliary_id integer,
    is_aux boolean DEFAULT false
);


ALTER TABLE otlo.equipment OWNER TO postgres;

--
-- Name: equipment_active_locks; Type: TABLE; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE TABLE equipment_active_locks (
    id integer NOT NULL,
    company_id integer NOT NULL,
    equipment_id integer NOT NULL,
    lock_id integer,
    key_id integer
);


ALTER TABLE otlo.equipment_active_locks OWNER TO postgres;

--
-- Name: equipment_active_locks_id_seq; Type: SEQUENCE; Schema: otlo; Owner: postgres
--

CREATE SEQUENCE equipment_active_locks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE otlo.equipment_active_locks_id_seq OWNER TO postgres;

--
-- Name: equipment_active_locks_id_seq; Type: SEQUENCE OWNED BY; Schema: otlo; Owner: postgres
--

ALTER SEQUENCE equipment_active_locks_id_seq OWNED BY equipment_active_locks.id;


--
-- Name: equipment_asset; Type: TABLE; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE TABLE equipment_asset (
    id integer NOT NULL,
    equipment_id integer NOT NULL,
    asset_type_id integer NOT NULL,
    name character varying(100),
    url character varying(256),
    hash character varying(100)
);


ALTER TABLE otlo.equipment_asset OWNER TO postgres;

--
-- Name: equipment_asset_id_seq; Type: SEQUENCE; Schema: otlo; Owner: postgres
--

CREATE SEQUENCE equipment_asset_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE otlo.equipment_asset_id_seq OWNER TO postgres;

--
-- Name: equipment_asset_id_seq; Type: SEQUENCE OWNED BY; Schema: otlo; Owner: postgres
--

ALTER SEQUENCE equipment_asset_id_seq OWNED BY equipment_asset.id;


--
-- Name: equipment_id_seq; Type: SEQUENCE; Schema: otlo; Owner: postgres
--

CREATE SEQUENCE equipment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE otlo.equipment_id_seq OWNER TO postgres;

--
-- Name: equipment_id_seq; Type: SEQUENCE OWNED BY; Schema: otlo; Owner: postgres
--

ALTER SEQUENCE equipment_id_seq OWNED BY equipment.id;


--
-- Name: equipment_secondary_identifier; Type: TABLE; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE TABLE equipment_secondary_identifier (
    id integer NOT NULL,
    equipment_id integer NOT NULL,
    name character varying(100) NOT NULL,
    is_auxiliary boolean DEFAULT false NOT NULL,
    is_nfc boolean DEFAULT true NOT NULL,
    is_qr boolean DEFAULT true NOT NULL
);


ALTER TABLE otlo.equipment_secondary_identifier OWNER TO postgres;

--
-- Name: equipment_secondary_identifier_id_seq; Type: SEQUENCE; Schema: otlo; Owner: postgres
--

CREATE SEQUENCE equipment_secondary_identifier_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE otlo.equipment_secondary_identifier_id_seq OWNER TO postgres;

--
-- Name: equipment_secondary_identifier_id_seq; Type: SEQUENCE OWNED BY; Schema: otlo; Owner: postgres
--

ALTER SEQUENCE equipment_secondary_identifier_id_seq OWNED BY equipment_secondary_identifier.id;


--
-- Name: equipment_status; Type: TABLE; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE TABLE equipment_status (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE otlo.equipment_status OWNER TO postgres;

--
-- Name: equipment_status_id_seq; Type: SEQUENCE; Schema: otlo; Owner: postgres
--

CREATE SEQUENCE equipment_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE otlo.equipment_status_id_seq OWNER TO postgres;

--
-- Name: equipment_status_id_seq; Type: SEQUENCE OWNED BY; Schema: otlo; Owner: postgres
--

ALTER SEQUENCE equipment_status_id_seq OWNED BY equipment_status.id;


--
-- Name: equipment_type; Type: TABLE; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE TABLE equipment_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE otlo.equipment_type OWNER TO postgres;

--
-- Name: event; Type: TABLE; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE TABLE event (
    id integer NOT NULL,
    company_id integer NOT NULL,
    event_type_id integer NOT NULL,
    event_status_id integer NOT NULL,
    event_mode_id integer NOT NULL,
    name character varying(100) NOT NULL,
    repeat integer DEFAULT 0 NOT NULL,
    scheduled_at timestamp without time zone NOT NULL,
    started_at timestamp without time zone,
    completed_at timestamp without time zone,
    notification character varying(256),
    scheduled_by integer,
    ignore_keys boolean DEFAULT false NOT NULL
);


ALTER TABLE otlo.event OWNER TO postgres;

--
-- Name: event_id_seq; Type: SEQUENCE; Schema: otlo; Owner: postgres
--

CREATE SEQUENCE event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE otlo.event_id_seq OWNER TO postgres;

--
-- Name: event_id_seq; Type: SEQUENCE OWNED BY; Schema: otlo; Owner: postgres
--

ALTER SEQUENCE event_id_seq OWNED BY event.id;


--
-- Name: event_mode; Type: TABLE; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE TABLE event_mode (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE otlo.event_mode OWNER TO postgres;

--
-- Name: event_mode_id_seq; Type: SEQUENCE; Schema: otlo; Owner: postgres
--

CREATE SEQUENCE event_mode_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE otlo.event_mode_id_seq OWNER TO postgres;

--
-- Name: event_mode_id_seq; Type: SEQUENCE OWNED BY; Schema: otlo; Owner: postgres
--

ALTER SEQUENCE event_mode_id_seq OWNED BY event_mode.id;


--
-- Name: event_report; Type: TABLE; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE TABLE event_report (
    id integer NOT NULL,
    event_id integer NOT NULL,
    report_id integer NOT NULL,
    normal_process_by integer,
    verification_process_by integer,
    normal_started_at timestamp without time zone,
    normal_completed_at timestamp without time zone,
    verification_started_at timestamp without time zone,
    verification_completed_at timestamp without time zone,
    is_normal boolean DEFAULT true NOT NULL,
    is_verification boolean DEFAULT false NOT NULL,
    ignore_keys boolean DEFAULT false NOT NULL
);


ALTER TABLE otlo.event_report OWNER TO postgres;

--
-- Name: event_report_data; Type: TABLE; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE TABLE event_report_data (
    id integer NOT NULL,
    event_report_id integer NOT NULL,
    equipment_id integer NOT NULL,
    is_enabled boolean DEFAULT true NOT NULL,
    is_normal_completed boolean DEFAULT false NOT NULL,
    is_verification_completed boolean DEFAULT false NOT NULL
);


ALTER TABLE otlo.event_report_data OWNER TO postgres;

--
-- Name: event_report_data_id_seq; Type: SEQUENCE; Schema: otlo; Owner: postgres
--

CREATE SEQUENCE event_report_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE otlo.event_report_data_id_seq OWNER TO postgres;

--
-- Name: event_report_data_id_seq; Type: SEQUENCE OWNED BY; Schema: otlo; Owner: postgres
--

ALTER SEQUENCE event_report_data_id_seq OWNED BY event_report_data.id;


--
-- Name: event_report_data_log; Type: TABLE; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE TABLE event_report_data_log (
    id integer NOT NULL,
    company_id integer NOT NULL,
    event_report_data_id integer NOT NULL,
    photo_link character varying(256),
    audio_link character varying(256),
    employee_id integer,
    equipment_id integer,
    created_at timestamp without time zone NOT NULL,
    key integer,
    lock integer,
    process_type integer NOT NULL,
    success boolean DEFAULT true NOT NULL
);


ALTER TABLE otlo.event_report_data_log OWNER TO postgres;

--
-- Name: event_report_data_log_id_seq; Type: SEQUENCE; Schema: otlo; Owner: postgres
--

CREATE SEQUENCE event_report_data_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE otlo.event_report_data_log_id_seq OWNER TO postgres;

--
-- Name: event_report_data_log_id_seq; Type: SEQUENCE OWNED BY; Schema: otlo; Owner: postgres
--

ALTER SEQUENCE event_report_data_log_id_seq OWNED BY event_report_data_log.id;


--
-- Name: event_report_id_seq; Type: SEQUENCE; Schema: otlo; Owner: postgres
--

CREATE SEQUENCE event_report_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE otlo.event_report_id_seq OWNER TO postgres;

--
-- Name: event_report_id_seq; Type: SEQUENCE OWNED BY; Schema: otlo; Owner: postgres
--

ALTER SEQUENCE event_report_id_seq OWNED BY event_report.id;


--
-- Name: event_status; Type: TABLE; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE TABLE event_status (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE otlo.event_status OWNER TO postgres;

--
-- Name: event_status_id_seq; Type: SEQUENCE; Schema: otlo; Owner: postgres
--

CREATE SEQUENCE event_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE otlo.event_status_id_seq OWNER TO postgres;

--
-- Name: event_status_id_seq; Type: SEQUENCE OWNED BY; Schema: otlo; Owner: postgres
--

ALTER SEQUENCE event_status_id_seq OWNED BY event_status.id;


--
-- Name: event_type; Type: TABLE; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE TABLE event_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE otlo.event_type OWNER TO postgres;

--
-- Name: event_type_id_seq; Type: SEQUENCE; Schema: otlo; Owner: postgres
--

CREATE SEQUENCE event_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE otlo.event_type_id_seq OWNER TO postgres;

--
-- Name: event_type_id_seq; Type: SEQUENCE OWNED BY; Schema: otlo; Owner: postgres
--

ALTER SEQUENCE event_type_id_seq OWNED BY event_type.id;


--
-- Name: instruction; Type: TABLE; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE TABLE instruction (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    company_id integer NOT NULL,
    instruction_type_id integer DEFAULT 1 NOT NULL,
    is_adhoc_default boolean DEFAULT false NOT NULL
);


ALTER TABLE otlo.instruction OWNER TO postgres;

--
-- Name: instruction_id_seq; Type: SEQUENCE; Schema: otlo; Owner: postgres
--

CREATE SEQUENCE instruction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE otlo.instruction_id_seq OWNER TO postgres;

--
-- Name: instruction_id_seq; Type: SEQUENCE OWNED BY; Schema: otlo; Owner: postgres
--

ALTER SEQUENCE instruction_id_seq OWNED BY instruction.id;


--
-- Name: instruction_type; Type: TABLE; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE TABLE instruction_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE otlo.instruction_type OWNER TO postgres;

--
-- Name: instruction_type_id_seq; Type: SEQUENCE; Schema: otlo; Owner: postgres
--

CREATE SEQUENCE instruction_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE otlo.instruction_type_id_seq OWNER TO postgres;

--
-- Name: instruction_type_id_seq; Type: SEQUENCE OWNED BY; Schema: otlo; Owner: postgres
--

ALTER SEQUENCE instruction_type_id_seq OWNED BY instruction_type.id;


--
-- Name: key; Type: TABLE; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE TABLE key (
    id integer NOT NULL,
    company_id integer NOT NULL,
    key_uid character varying(100) NOT NULL,
    key_assoc_type_id integer DEFAULT 1 NOT NULL,
    key_association_id integer,
    department_id integer
);


ALTER TABLE otlo.key OWNER TO postgres;

--
-- Name: key_association; Type: TABLE; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE TABLE key_association (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE otlo.key_association OWNER TO postgres;

--
-- Name: key_association_id_seq; Type: SEQUENCE; Schema: otlo; Owner: postgres
--

CREATE SEQUENCE key_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE otlo.key_association_id_seq OWNER TO postgres;

--
-- Name: key_association_id_seq; Type: SEQUENCE OWNED BY; Schema: otlo; Owner: postgres
--

ALTER SEQUENCE key_association_id_seq OWNED BY key_association.id;


--
-- Name: key_id_seq; Type: SEQUENCE; Schema: otlo; Owner: postgres
--

CREATE SEQUENCE key_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE otlo.key_id_seq OWNER TO postgres;

--
-- Name: key_id_seq; Type: SEQUENCE OWNED BY; Schema: otlo; Owner: postgres
--

ALTER SEQUENCE key_id_seq OWNED BY key.id;


--
-- Name: key_lock; Type: TABLE; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE TABLE key_lock (
    key_id integer NOT NULL,
    lock_id integer NOT NULL
);


ALTER TABLE otlo.key_lock OWNER TO postgres;

--
-- Name: key_secondary_identifier; Type: TABLE; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE TABLE key_secondary_identifier (
    id integer NOT NULL,
    key_id integer NOT NULL,
    name character varying(100) NOT NULL,
    is_nfc boolean DEFAULT true NOT NULL,
    is_qr boolean NOT NULL
);


ALTER TABLE otlo.key_secondary_identifier OWNER TO postgres;

--
-- Name: key_secondary_identifier_id_seq; Type: SEQUENCE; Schema: otlo; Owner: postgres
--

CREATE SEQUENCE key_secondary_identifier_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE otlo.key_secondary_identifier_id_seq OWNER TO postgres;

--
-- Name: key_secondary_identifier_id_seq; Type: SEQUENCE OWNED BY; Schema: otlo; Owner: postgres
--

ALTER SEQUENCE key_secondary_identifier_id_seq OWNED BY key_secondary_identifier.id;


--
-- Name: location; Type: TABLE; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE TABLE location (
    id integer NOT NULL,
    company_id integer NOT NULL,
    business_unit_id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE otlo.location OWNER TO postgres;

--
-- Name: location_id_seq; Type: SEQUENCE; Schema: otlo; Owner: postgres
--

CREATE SEQUENCE location_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE otlo.location_id_seq OWNER TO postgres;

--
-- Name: location_id_seq; Type: SEQUENCE OWNED BY; Schema: otlo; Owner: postgres
--

ALTER SEQUENCE location_id_seq OWNED BY location.id;


--
-- Name: lock; Type: TABLE; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE TABLE lock (
    id integer NOT NULL,
    company_id integer NOT NULL,
    lock_uid character varying(100) NOT NULL
);


ALTER TABLE otlo.lock OWNER TO postgres;

--
-- Name: lock_id_seq; Type: SEQUENCE; Schema: otlo; Owner: postgres
--

CREATE SEQUENCE lock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE otlo.lock_id_seq OWNER TO postgres;

--
-- Name: lock_id_seq; Type: SEQUENCE OWNED BY; Schema: otlo; Owner: postgres
--

ALTER SEQUENCE lock_id_seq OWNED BY lock.id;


--
-- Name: lock_secondary_identifier; Type: TABLE; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE TABLE lock_secondary_identifier (
    id integer NOT NULL,
    lock_id integer NOT NULL,
    name character varying(100) NOT NULL,
    is_nfc boolean DEFAULT true NOT NULL,
    is_qr boolean DEFAULT false NOT NULL
);


ALTER TABLE otlo.lock_secondary_identifier OWNER TO postgres;

--
-- Name: lock_secondary_identifier_id_seq; Type: SEQUENCE; Schema: otlo; Owner: postgres
--

CREATE SEQUENCE lock_secondary_identifier_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE otlo.lock_secondary_identifier_id_seq OWNER TO postgres;

--
-- Name: lock_secondary_identifier_id_seq; Type: SEQUENCE OWNED BY; Schema: otlo; Owner: postgres
--

ALTER SEQUENCE lock_secondary_identifier_id_seq OWNED BY lock_secondary_identifier.id;


--
-- Name: pda; Type: TABLE; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE TABLE pda (
    id integer NOT NULL,
    employee_id integer NOT NULL,
    pda_id character varying(256) NOT NULL,
    token character varying(256) NOT NULL,
    signed_in timestamp without time zone
);


ALTER TABLE otlo.pda OWNER TO postgres;

--
-- Name: pda_id_seq; Type: SEQUENCE; Schema: otlo; Owner: postgres
--

CREATE SEQUENCE pda_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE otlo.pda_id_seq OWNER TO postgres;

--
-- Name: pda_id_seq; Type: SEQUENCE OWNED BY; Schema: otlo; Owner: postgres
--

ALTER SEQUENCE pda_id_seq OWNED BY pda.id;


--
-- Name: permission; Type: TABLE; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE TABLE permission (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(100) NOT NULL,
    action_id integer NOT NULL
);


ALTER TABLE otlo.permission OWNER TO postgres;

--
-- Name: permission_id_seq; Type: SEQUENCE; Schema: otlo; Owner: postgres
--

CREATE SEQUENCE permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE otlo.permission_id_seq OWNER TO postgres;

--
-- Name: permission_id_seq; Type: SEQUENCE OWNED BY; Schema: otlo; Owner: postgres
--

ALTER SEQUENCE permission_id_seq OWNED BY permission.id;


--
-- Name: report; Type: TABLE; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE TABLE report (
    id integer NOT NULL,
    company_id integer NOT NULL,
    name character varying(100) NOT NULL,
    report_type_id integer NOT NULL,
    report_status_id integer,
    process_type_id integer
);


ALTER TABLE otlo.report OWNER TO postgres;

--
-- Name: report_department; Type: TABLE; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE TABLE report_department (
    report_id integer NOT NULL,
    department_id integer NOT NULL
);


ALTER TABLE otlo.report_department OWNER TO postgres;

--
-- Name: report_id_seq; Type: SEQUENCE; Schema: otlo; Owner: postgres
--

CREATE SEQUENCE report_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE otlo.report_id_seq OWNER TO postgres;

--
-- Name: report_id_seq; Type: SEQUENCE OWNED BY; Schema: otlo; Owner: postgres
--

ALTER SEQUENCE report_id_seq OWNED BY report.id;


--
-- Name: report_instruction; Type: TABLE; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE TABLE report_instruction (
    report_id integer NOT NULL,
    instruction_id integer NOT NULL
);


ALTER TABLE otlo.report_instruction OWNER TO postgres;

--
-- Name: report_process_type; Type: TABLE; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE TABLE report_process_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE otlo.report_process_type OWNER TO postgres;

--
-- Name: report_role; Type: TABLE; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE TABLE report_role (
    role_id integer NOT NULL,
    report_id integer NOT NULL
);


ALTER TABLE otlo.report_role OWNER TO postgres;

--
-- Name: report_status; Type: TABLE; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE TABLE report_status (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE otlo.report_status OWNER TO postgres;

--
-- Name: report_status_id_seq; Type: SEQUENCE; Schema: otlo; Owner: postgres
--

CREATE SEQUENCE report_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE otlo.report_status_id_seq OWNER TO postgres;

--
-- Name: report_status_id_seq; Type: SEQUENCE OWNED BY; Schema: otlo; Owner: postgres
--

ALTER SEQUENCE report_status_id_seq OWNED BY report_status.id;


--
-- Name: report_type; Type: TABLE; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE TABLE report_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE otlo.report_type OWNER TO postgres;

--
-- Name: report_type_id_seq; Type: SEQUENCE; Schema: otlo; Owner: postgres
--

CREATE SEQUENCE report_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE otlo.report_type_id_seq OWNER TO postgres;

--
-- Name: report_type_id_seq; Type: SEQUENCE OWNED BY; Schema: otlo; Owner: postgres
--

ALTER SEQUENCE report_type_id_seq OWNED BY report_type.id;


--
-- Name: role; Type: TABLE; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE TABLE role (
    id integer NOT NULL,
    company_id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE otlo.role OWNER TO postgres;

--
-- Name: role_id_seq; Type: SEQUENCE; Schema: otlo; Owner: postgres
--

CREATE SEQUENCE role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE otlo.role_id_seq OWNER TO postgres;

--
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: otlo; Owner: postgres
--

ALTER SEQUENCE role_id_seq OWNED BY role.id;


--
-- Name: role_permission; Type: TABLE; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE TABLE role_permission (
    role_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE otlo.role_permission OWNER TO postgres;

--
-- Name: sequence_group; Type: TABLE; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE TABLE sequence_group (
    id integer NOT NULL,
    sequence_type_id integer DEFAULT 1 NOT NULL,
    unit_operation_id integer NOT NULL,
    instruction_id integer NOT NULL
);


ALTER TABLE otlo.sequence_group OWNER TO postgres;

--
-- Name: sequence_group_id_seq; Type: SEQUENCE; Schema: otlo; Owner: postgres
--

CREATE SEQUENCE sequence_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE otlo.sequence_group_id_seq OWNER TO postgres;

--
-- Name: sequence_group_id_seq; Type: SEQUENCE OWNED BY; Schema: otlo; Owner: postgres
--

ALTER SEQUENCE sequence_group_id_seq OWNED BY sequence_group.id;


--
-- Name: sequence_record; Type: TABLE; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE TABLE sequence_record (
    id integer NOT NULL,
    idx integer DEFAULT (-1) NOT NULL,
    equipment_id integer,
    description character varying(256) NOT NULL,
    sequence_group_id integer NOT NULL,
    preview_url character varying(255)
);


ALTER TABLE otlo.sequence_record OWNER TO postgres;

--
-- Name: sequence_record_id_seq; Type: SEQUENCE; Schema: otlo; Owner: postgres
--

CREATE SEQUENCE sequence_record_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE otlo.sequence_record_id_seq OWNER TO postgres;

--
-- Name: sequence_record_id_seq; Type: SEQUENCE OWNED BY; Schema: otlo; Owner: postgres
--

ALTER SEQUENCE sequence_record_id_seq OWNED BY sequence_record.id;


--
-- Name: sequence_type; Type: TABLE; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE TABLE sequence_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE otlo.sequence_type OWNER TO postgres;

--
-- Name: sequence_type_id_seq; Type: SEQUENCE; Schema: otlo; Owner: postgres
--

CREATE SEQUENCE sequence_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE otlo.sequence_type_id_seq OWNER TO postgres;

--
-- Name: sequence_type_id_seq; Type: SEQUENCE OWNED BY; Schema: otlo; Owner: postgres
--

ALTER SEQUENCE sequence_type_id_seq OWNED BY sequence_type.id;


--
-- Name: simple_log; Type: TABLE; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE TABLE simple_log (
    id integer NOT NULL,
    company_id integer NOT NULL,
    simple_log_type_id integer NOT NULL,
    description character varying(256) NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE otlo.simple_log OWNER TO postgres;

--
-- Name: simple_log_id_seq; Type: SEQUENCE; Schema: otlo; Owner: postgres
--

CREATE SEQUENCE simple_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE otlo.simple_log_id_seq OWNER TO postgres;

--
-- Name: simple_log_id_seq; Type: SEQUENCE OWNED BY; Schema: otlo; Owner: postgres
--

ALTER SEQUENCE simple_log_id_seq OWNED BY simple_log.id;


--
-- Name: simple_log_type; Type: TABLE; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE TABLE simple_log_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE otlo.simple_log_type OWNER TO postgres;

--
-- Name: simple_log_type_id_seq; Type: SEQUENCE; Schema: otlo; Owner: postgres
--

CREATE SEQUENCE simple_log_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE otlo.simple_log_type_id_seq OWNER TO postgres;

--
-- Name: simple_log_type_id_seq; Type: SEQUENCE OWNED BY; Schema: otlo; Owner: postgres
--

ALTER SEQUENCE simple_log_type_id_seq OWNED BY simple_log_type.id;


--
-- Name: unit_operation; Type: TABLE; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE TABLE unit_operation (
    id integer NOT NULL,
    company_id integer NOT NULL,
    location_id integer NOT NULL,
    name character varying(100) NOT NULL,
    diagram_link character varying(256)
);


ALTER TABLE otlo.unit_operation OWNER TO postgres;

--
-- Name: unit_operation_id_seq; Type: SEQUENCE; Schema: otlo; Owner: postgres
--

CREATE SEQUENCE unit_operation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE otlo.unit_operation_id_seq OWNER TO postgres;

--
-- Name: unit_operation_id_seq; Type: SEQUENCE OWNED BY; Schema: otlo; Owner: postgres
--

ALTER SEQUENCE unit_operation_id_seq OWNED BY unit_operation.id;


SET search_path = public, pg_catalog;

--
-- Name: play_evolutions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE play_evolutions (
    id integer NOT NULL,
    hash character varying(255) NOT NULL,
    applied_at timestamp without time zone NOT NULL,
    apply_script text,
    revert_script text,
    state character varying(255),
    last_problem text
);


ALTER TABLE public.play_evolutions OWNER TO postgres;

SET search_path = otlo, pg_catalog;

--
-- Name: id; Type: DEFAULT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY action ALTER COLUMN id SET DEFAULT nextval('action_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY adhoc ALTER COLUMN id SET DEFAULT nextval('adhoc_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY adhoc_status ALTER COLUMN id SET DEFAULT nextval('adhoc_status_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY adhoc_type ALTER COLUMN id SET DEFAULT nextval('adhoc_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY asset_type ALTER COLUMN id SET DEFAULT nextval('asset_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY business_unit ALTER COLUMN id SET DEFAULT nextval('business_unit_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY company ALTER COLUMN id SET DEFAULT nextval('company_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY company_settings ALTER COLUMN id SET DEFAULT nextval('company_settings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY department ALTER COLUMN id SET DEFAULT nextval('department_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY employee ALTER COLUMN id SET DEFAULT nextval('employee_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY employee_secondary_identifier ALTER COLUMN id SET DEFAULT nextval('employee_secondary_identifier_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY equipment ALTER COLUMN id SET DEFAULT nextval('equipment_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY equipment_active_locks ALTER COLUMN id SET DEFAULT nextval('equipment_active_locks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY equipment_asset ALTER COLUMN id SET DEFAULT nextval('equipment_asset_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY equipment_secondary_identifier ALTER COLUMN id SET DEFAULT nextval('equipment_secondary_identifier_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY equipment_status ALTER COLUMN id SET DEFAULT nextval('equipment_status_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY event ALTER COLUMN id SET DEFAULT nextval('event_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY event_mode ALTER COLUMN id SET DEFAULT nextval('event_mode_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY event_report ALTER COLUMN id SET DEFAULT nextval('event_report_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY event_report_data ALTER COLUMN id SET DEFAULT nextval('event_report_data_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY event_report_data_log ALTER COLUMN id SET DEFAULT nextval('event_report_data_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY event_status ALTER COLUMN id SET DEFAULT nextval('event_status_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY event_type ALTER COLUMN id SET DEFAULT nextval('event_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY instruction ALTER COLUMN id SET DEFAULT nextval('instruction_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY instruction_type ALTER COLUMN id SET DEFAULT nextval('instruction_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY key ALTER COLUMN id SET DEFAULT nextval('key_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY key_association ALTER COLUMN id SET DEFAULT nextval('key_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY key_secondary_identifier ALTER COLUMN id SET DEFAULT nextval('key_secondary_identifier_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY location ALTER COLUMN id SET DEFAULT nextval('location_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY lock ALTER COLUMN id SET DEFAULT nextval('lock_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY lock_secondary_identifier ALTER COLUMN id SET DEFAULT nextval('lock_secondary_identifier_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY pda ALTER COLUMN id SET DEFAULT nextval('pda_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY permission ALTER COLUMN id SET DEFAULT nextval('permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY report ALTER COLUMN id SET DEFAULT nextval('report_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY report_status ALTER COLUMN id SET DEFAULT nextval('report_status_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY report_type ALTER COLUMN id SET DEFAULT nextval('report_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY role ALTER COLUMN id SET DEFAULT nextval('role_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY sequence_group ALTER COLUMN id SET DEFAULT nextval('sequence_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY sequence_record ALTER COLUMN id SET DEFAULT nextval('sequence_record_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY sequence_type ALTER COLUMN id SET DEFAULT nextval('sequence_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY simple_log ALTER COLUMN id SET DEFAULT nextval('simple_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY simple_log_type ALTER COLUMN id SET DEFAULT nextval('simple_log_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY unit_operation ALTER COLUMN id SET DEFAULT nextval('unit_operation_id_seq'::regclass);


--
-- Data for Name: action; Type: TABLE DATA; Schema: otlo; Owner: postgres
--

COPY action (id, name) FROM stdin;
0	global
1	create
2	edit
3	view
4	delete
5	control
6	mobile
\.


--
-- Name: action_id_seq; Type: SEQUENCE SET; Schema: otlo; Owner: postgres
--

SELECT pg_catalog.setval('action_id_seq', 1, false);


--
-- Data for Name: adhoc; Type: TABLE DATA; Schema: otlo; Owner: postgres
--

COPY adhoc (id, company_id, equipment_id, event_id, requested_by, requested_at, inspected_by, adhoc_status_id, adhoc_type_id, auxiliary_equipment_id, auxiliary_equipment_type_id, created_at, inspected_at, image, comment) FROM stdin;
\.


--
-- Name: adhoc_id_seq; Type: SEQUENCE SET; Schema: otlo; Owner: postgres
--

SELECT pg_catalog.setval('adhoc_id_seq', 1, false);


--
-- Data for Name: adhoc_status; Type: TABLE DATA; Schema: otlo; Owner: postgres
--

COPY adhoc_status (id, name) FROM stdin;
\.


--
-- Name: adhoc_status_id_seq; Type: SEQUENCE SET; Schema: otlo; Owner: postgres
--

SELECT pg_catalog.setval('adhoc_status_id_seq', 1, false);


--
-- Data for Name: adhoc_type; Type: TABLE DATA; Schema: otlo; Owner: postgres
--

COPY adhoc_type (id, name) FROM stdin;
\.


--
-- Name: adhoc_type_id_seq; Type: SEQUENCE SET; Schema: otlo; Owner: postgres
--

SELECT pg_catalog.setval('adhoc_type_id_seq', 1, false);


--
-- Data for Name: asset_type; Type: TABLE DATA; Schema: otlo; Owner: postgres
--

COPY asset_type (id, name) FROM stdin;
1	document
2	image
3	link
\.


--
-- Name: asset_type_id_seq; Type: SEQUENCE SET; Schema: otlo; Owner: postgres
--

SELECT pg_catalog.setval('asset_type_id_seq', 1, false);


--
-- Data for Name: auxiliary_equipment; Type: TABLE DATA; Schema: otlo; Owner: postgres
--

COPY auxiliary_equipment (equipment_id, auxiliary_equipment_id) FROM stdin;
\.


--
-- Data for Name: business_unit; Type: TABLE DATA; Schema: otlo; Owner: postgres
--

COPY business_unit (id, company_id, name) FROM stdin;
1	1	Plant 1
\.


--
-- Name: business_unit_id_seq; Type: SEQUENCE SET; Schema: otlo; Owner: postgres
--

SELECT pg_catalog.setval('business_unit_id_seq', 1, true);


--
-- Data for Name: company; Type: TABLE DATA; Schema: otlo; Owner: postgres
--

COPY company (id, name, address, city, postal, country, phone, email, created_at) FROM stdin;
1	Beacontree Technologies	1141 Broadview Avenue, Suite 200	Toronto	M4K 2S6	Canada	+1 (416) 423-2900	George.Roberts@beacontree.net	2017-05-06 23:12:00.884
\.


--
-- Name: company_id_seq; Type: SEQUENCE SET; Schema: otlo; Owner: postgres
--

SELECT pg_catalog.setval('company_id_seq', 1, true);


--
-- Data for Name: company_settings; Type: TABLE DATA; Schema: otlo; Owner: postgres
--

COPY company_settings (id, company_id, key, value) FROM stdin;
\.


--
-- Name: company_settings_id_seq; Type: SEQUENCE SET; Schema: otlo; Owner: postgres
--

SELECT pg_catalog.setval('company_settings_id_seq', 1, false);


--
-- Data for Name: department; Type: TABLE DATA; Schema: otlo; Owner: postgres
--

COPY department (id, company_id, name) FROM stdin;
1	1	Millwright
2	1	Mechanical
3	1	Operations
4	1	Electrical
5	1	Pipefitter
6	1	IT
7	1	Administration
8	1	Engineering
9	1	Project Management
\.


--
-- Name: department_id_seq; Type: SEQUENCE SET; Schema: otlo; Owner: postgres
--

SELECT pg_catalog.setval('department_id_seq', 9, true);


--
-- Data for Name: employee; Type: TABLE DATA; Schema: otlo; Owner: postgres
--

COPY employee (id, company_id, role_id, department_id, employee_uid, first_name, last_name, email, password, pda_pin, last_activity, phone) FROM stdin;
3	1	4	1	10030	Navneet	Kaur	navneetkang14@gmail.com	1234	1234	2017-05-26 18:23:07.262	+1 (306) 216-2555
11	1	3	2	10011	Pedram	Faghihi	pedram.faghihi@gmail.com	1234	1234	2017-05-29 01:48:17.746	+1 (647) 704-6061
2	1	1	3	10029	Jaspreet	Kaur	jaspreet.toor13@gmail.com	1234	1234	2017-05-26 18:23:33.747	+1 (647) 323-1583
9	1	1	6	10032	Abrahim	Abrahao	abrahimsabrahao@yahoo.ca	1234	1234	2017-05-29 01:49:18.342	+1 (647) 628-9272
7	1	1	8	10023	Mahdieh	Taghizadeh	mahdieh.taghizadeh15@gmail.com	1234	1234	2017-05-08 13:33:44.858	+1 (416) 669-3486
8	1	1	6	10024	Burak	Ates	imburakates@gmail.com	1234	1234	2017-05-27 00:44:34.222	+1 (647) 939-2932
5	1	3	1	10031	Rajdeep	Kaur	rajdeep.kaur1694@gmail.com	1234	1234	2017-05-07 04:40:24.381	+1 (647) 740-3756
12	1	2	9	10017	Sergey	Pinigin	pinigin@gmail.com	1234	1234	2017-05-29 01:54:07.357	+1 (416) 918-3221
10	1	1	6	10033	Clement	Ojo	clement.ojo@live.com	1234	1234	2017-05-29 00:48:49.6	+1 (647) 570-7983
6	1	1	4	10004	George	Roberts	George.Roberts@beacontree.net	1234	1234	2017-07-13 01:50:58.549	+1 416 423-2900
1	1	1	1	10001	user1	pass1	a@a.com	12345678	1234	2017-07-25 14:25:28.322	123456
\.


--
-- Name: employee_id_seq; Type: SEQUENCE SET; Schema: otlo; Owner: postgres
--

SELECT pg_catalog.setval('employee_id_seq', 12, true);


--
-- Data for Name: employee_secondary_identifier; Type: TABLE DATA; Schema: otlo; Owner: postgres
--

COPY employee_secondary_identifier (id, employee_id, name, is_nfc, is_qr) FROM stdin;
1	2	10029	f	t
3	1	10030	f	t
4	3	10030	f	t
5	5	10031	f	t
6	6	04577b426f3f81	t	f
7	6	10004	f	t
8	7	047372426f3f80	t	f
9	7	10023	f	t
10	8	10024	f	t
11	10	10033	f	t
12	11	043A801AFE4567	t	f
13	11	10011	f	t
14	9	10032	f	t
15	12	10017	f	t
\.


--
-- Name: employee_secondary_identifier_id_seq; Type: SEQUENCE SET; Schema: otlo; Owner: postgres
--

SELECT pg_catalog.setval('employee_secondary_identifier_id_seq', 15, true);


--
-- Data for Name: equipment; Type: TABLE DATA; Schema: otlo; Owner: postgres
--

COPY equipment (id, equipment_uid, name, company_id, photo, audio, is_locked, is_tagged, status_id, unit_operation_id, updated_at, type_id, auxiliary_id, is_aux) FROM stdin;
7	V-2135a	Pump #5 - Input Isolation Valve	1	f	f	f	f	1	3	2017-05-07 18:54:07.579	1	\N	f
8	V-2135b	Pump #5 - Output Isolation Valve	1	f	f	f	f	1	3	2017-05-07 18:55:20.82	2	\N	f
9	V-2135c	Pump #5 - Drain Valve	1	f	f	f	f	1	3	2017-05-07 18:56:44.358	2	\N	f
17	Ad-Hoc5	Pump #6 - Drain Valve	1	f	f	f	f	1	4	2017-05-07 20:11:14.499	2	\N	f
18	Ad-Hoc6	Motor Circuit Breaker - Pump #6	1	f	f	f	f	1	4	2017-05-07 20:14:08.076	1	\N	f
16	Ad-Hoc4	Pump #6 - Output Isolation Valve	1	f	f	f	f	1	4	2017-05-07 20:22:07.854	2	\N	f
15	Ad-Hoc3	Pump #6 - Input Isolation Valve	1	f	f	f	f	1	4	2017-05-07 20:37:16.939	1	\N	f
13	Ad-Hoc1	FCV-2139 Pneumatic Supply Valve	1	f	f	f	f	1	3	2017-05-08 01:33:57.56	2	\N	f
14	Ad-Hoc2	Boiler #2 Water Flow Control Valve	1	t	t	f	f	1	3	2017-05-08 01:47:10.651	2	\N	f
1	MCB-2134	Motor Circuit Breaker - Pump #4	1	f	f	f	f	1	1	2017-05-08 01:51:31.702	1	\N	f
12	V-1501a	Tank #1 - Isolation Valve	1	t	f	f	f	1	5	2017-05-08 01:52:47.492	2	\N	f
2	MCB-2135	Motor Circuit Breaker - Pump #5	1	f	f	f	f	1	1	2017-05-08 01:54:13.947	1	\N	f
3	V-2134a	Pump #4 - Input Isolation Valve	1	t	f	f	f	1	2	2017-05-08 01:55:13.857	1	\N	f
4	V-2134b	Pump #4 - Output Isolation Valve	1	t	t	f	f	1	2	2017-05-08 01:56:40.809	2	\N	f
6	V-2134c	Pump #4 - Drain Valve	1	t	f	f	f	1	2	2017-05-08 01:57:38.056	2	\N	f
10	V-2138	FCV-2138 Pneumatic Supply Valve	1	t	f	f	f	1	2	2017-05-08 01:59:45.376	2	\N	f
11	FCV-2138	Boiler #1 Water Flow Control Valve	1	t	f	f	f	1	2	2017-05-08 02:00:54.568	2	\N	f
19	2	12	1	t	f	f	f	1	\N	2017-05-09 13:11:59.196	1	\N	f
20	12	122	1	t	f	f	f	1	5	2017-05-13 13:35:08.947	1	\N	f
\.


--
-- Data for Name: equipment_active_locks; Type: TABLE DATA; Schema: otlo; Owner: postgres
--

COPY equipment_active_locks (id, company_id, equipment_id, lock_id, key_id) FROM stdin;
\.


--
-- Name: equipment_active_locks_id_seq; Type: SEQUENCE SET; Schema: otlo; Owner: postgres
--

SELECT pg_catalog.setval('equipment_active_locks_id_seq', 1, false);


--
-- Data for Name: equipment_asset; Type: TABLE DATA; Schema: otlo; Owner: postgres
--

COPY equipment_asset (id, equipment_id, asset_type_id, name, url, hash) FROM stdin;
\.


--
-- Name: equipment_asset_id_seq; Type: SEQUENCE SET; Schema: otlo; Owner: postgres
--

SELECT pg_catalog.setval('equipment_asset_id_seq', 1, false);


--
-- Name: equipment_id_seq; Type: SEQUENCE SET; Schema: otlo; Owner: postgres
--

SELECT pg_catalog.setval('equipment_id_seq', 20, true);


--
-- Data for Name: equipment_secondary_identifier; Type: TABLE DATA; Schema: otlo; Owner: postgres
--

COPY equipment_secondary_identifier (id, equipment_id, name, is_auxiliary, is_nfc, is_qr) FROM stdin;
6	7	V-2135a	f	f	t
7	8	V-2135b	f	f	t
8	9	V-2135c	f	f	t
16	17	Ad-Hoc5	f	t	f
17	17	QR-011	f	f	t
18	18	Ad-Hoc6	f	t	f
19	18	QR-012	f	f	t
20	16	Ad-Hoc4	f	t	f
21	16	QR-010	f	f	t
22	15	Ad-Hoc3	f	t	f
23	15	QR-009	f	f	t
24	13	QR-0003	f	f	t
12	13	e0040100289e174c	f	t	f
13	14	e0040100289e6548	f	t	f
25	14	QR-0004	f	f	t
1	1	e0040100289e6832	f	t	f
26	1	QR-0001	f	f	t
11	12	e0040100289e2593	f	t	f
27	12	QR-0002	f	f	t
2	2	e0040100289e69d0	f	t	f
28	2	MCB-2135	f	f	t
3	3	e0040100289e1b8d	f	t	f
29	3	V-2134a	f	f	t
4	4	e0040100289e690d	f	t	f
30	4	V-2134b	f	f	t
5	6	e004010028a15a24	f	t	f
31	6	V-2134c	f	f	t
9	10	e0040100289e59fd	f	t	f
32	10	V-2138	f	f	t
10	11	e0040100289e6be4	f	t	f
33	11	FCV-2138	f	f	t
\.


--
-- Name: equipment_secondary_identifier_id_seq; Type: SEQUENCE SET; Schema: otlo; Owner: postgres
--

SELECT pg_catalog.setval('equipment_secondary_identifier_id_seq', 33, true);


--
-- Data for Name: equipment_status; Type: TABLE DATA; Schema: otlo; Owner: postgres
--

COPY equipment_status (id, name) FROM stdin;
1	enabled
2	adhoc
3	disabled
\.


--
-- Name: equipment_status_id_seq; Type: SEQUENCE SET; Schema: otlo; Owner: postgres
--

SELECT pg_catalog.setval('equipment_status_id_seq', 1, false);


--
-- Data for Name: equipment_type; Type: TABLE DATA; Schema: otlo; Owner: postgres
--

COPY equipment_type (id, name) FROM stdin;
1	TYPE_LOCK
2	TYPE_TAG
3	TYPE_LOCKTAG
4	TYPE_AUXILIARY
\.


--
-- Data for Name: event; Type: TABLE DATA; Schema: otlo; Owner: postgres
--

COPY event (id, company_id, event_type_id, event_status_id, event_mode_id, name, repeat, scheduled_at, started_at, completed_at, notification, scheduled_by, ignore_keys) FROM stdin;
34	1	2	6	3	test abrahim	10	2017-07-26 00:00:00	\N	\N	\N	\N	f
40	1	2	1	3	Event Setup Verification	5	2017-07-30 00:00:00	\N	\N	\N	\N	f
42	1	1	1	3	shut verification 2017-09-13 00:00 am not checked 8	8	2017-09-13 00:00:00	\N	\N	\N	\N	f
44	1	2	1	3	event  startup verification 2017-07-10 00:00 am checked 3	3	2017-07-10 00:00:00	\N	\N	\N	\N	t
\.


--
-- Name: event_id_seq; Type: SEQUENCE SET; Schema: otlo; Owner: postgres
--

SELECT pg_catalog.setval('event_id_seq', 44, true);


--
-- Data for Name: event_mode; Type: TABLE DATA; Schema: otlo; Owner: postgres
--

COPY event_mode (id, name) FROM stdin;
1	Normal
2	Normal-verification
3	Verification
\.


--
-- Name: event_mode_id_seq; Type: SEQUENCE SET; Schema: otlo; Owner: postgres
--

SELECT pg_catalog.setval('event_mode_id_seq', 1, false);


--
-- Data for Name: event_report; Type: TABLE DATA; Schema: otlo; Owner: postgres
--

COPY event_report (id, event_id, report_id, normal_process_by, verification_process_by, normal_started_at, normal_completed_at, verification_started_at, verification_completed_at, is_normal, is_verification, ignore_keys) FROM stdin;
14	44	77	\N	\N	\N	\N	\N	\N	f	t	t
16	42	78	1	1	\N	\N	\N	\N	f	t	f
\.


--
-- Data for Name: event_report_data; Type: TABLE DATA; Schema: otlo; Owner: postgres
--

COPY event_report_data (id, event_report_id, equipment_id, is_enabled, is_normal_completed, is_verification_completed) FROM stdin;
\.


--
-- Name: event_report_data_id_seq; Type: SEQUENCE SET; Schema: otlo; Owner: postgres
--

SELECT pg_catalog.setval('event_report_data_id_seq', 78, true);


--
-- Data for Name: event_report_data_log; Type: TABLE DATA; Schema: otlo; Owner: postgres
--

COPY event_report_data_log (id, company_id, event_report_data_id, photo_link, audio_link, employee_id, equipment_id, created_at, key, lock, process_type, success) FROM stdin;
\.


--
-- Name: event_report_data_log_id_seq; Type: SEQUENCE SET; Schema: otlo; Owner: postgres
--

SELECT pg_catalog.setval('event_report_data_log_id_seq', 1, false);


--
-- Name: event_report_id_seq; Type: SEQUENCE SET; Schema: otlo; Owner: postgres
--

SELECT pg_catalog.setval('event_report_id_seq', 16, true);


--
-- Data for Name: event_status; Type: TABLE DATA; Schema: otlo; Owner: postgres
--

COPY event_status (id, name) FROM stdin;
1	Waiting
2	Scheduled
3	Started
4	Completed
5	Approved
6	Canceled
\.


--
-- Name: event_status_id_seq; Type: SEQUENCE SET; Schema: otlo; Owner: postgres
--

SELECT pg_catalog.setval('event_status_id_seq', 1, false);


--
-- Data for Name: event_type; Type: TABLE DATA; Schema: otlo; Owner: postgres
--

COPY event_type (id, name) FROM stdin;
1	Normal
2	Normal-Verification
3	Verification
\.


--
-- Name: event_type_id_seq; Type: SEQUENCE SET; Schema: otlo; Owner: postgres
--

SELECT pg_catalog.setval('event_type_id_seq', 1, false);


--
-- Data for Name: instruction; Type: TABLE DATA; Schema: otlo; Owner: postgres
--

COPY instruction (id, name, company_id, instruction_type_id, is_adhoc_default) FROM stdin;
1	Pump #4	1	1	f
26	Pump #5	1	1	f
27	Pump #5	1	2	f
22	MCC-2 Pumps	1	1	f
23	MCC-2 Pumps	1	2	f
31	Pump #4	1	2	f
20	Ad-Hoc Set 1 (FCV-2139)	1	1	f
21	Ad-Hoc Set 1 (FCV-2139)	1	2	f
30	Ad-Hoc Set 2 (Pump #6)	1	2	f
29	Ad-Hoc Set 2 (Pump #6)	1	1	f
33	Storage Tank #1	1	2	f
25	Flow Control Valve #2138	1	2	f
24	Flow Control Valve #2138	1	1	f
35	instruction setup abrahim test	1	2	f
34	instruction setup abrahim test	1	1	t
32	Storage Tank #1	1	1	t
36	Instruction test setup	1	2	f
37	Instruction test setup	1	1	f
\.


--
-- Name: instruction_id_seq; Type: SEQUENCE SET; Schema: otlo; Owner: postgres
--

SELECT pg_catalog.setval('instruction_id_seq', 37, true);


--
-- Data for Name: instruction_type; Type: TABLE DATA; Schema: otlo; Owner: postgres
--

COPY instruction_type (id, name) FROM stdin;
1	Isolation
2	Restoration
\.


--
-- Name: instruction_type_id_seq; Type: SEQUENCE SET; Schema: otlo; Owner: postgres
--

SELECT pg_catalog.setval('instruction_type_id_seq', 1, false);


--
-- Data for Name: key; Type: TABLE DATA; Schema: otlo; Owner: postgres
--

COPY key (id, company_id, key_uid, key_assoc_type_id, key_association_id, department_id) FROM stdin;
\.


--
-- Data for Name: key_association; Type: TABLE DATA; Schema: otlo; Owner: postgres
--

COPY key_association (id, name) FROM stdin;
1	Personal
2	Unit Operation
3	Location
\.


--
-- Name: key_association_id_seq; Type: SEQUENCE SET; Schema: otlo; Owner: postgres
--

SELECT pg_catalog.setval('key_association_id_seq', 1, false);


--
-- Name: key_id_seq; Type: SEQUENCE SET; Schema: otlo; Owner: postgres
--

SELECT pg_catalog.setval('key_id_seq', 5, true);


--
-- Data for Name: key_lock; Type: TABLE DATA; Schema: otlo; Owner: postgres
--

COPY key_lock (key_id, lock_id) FROM stdin;
\.


--
-- Data for Name: key_secondary_identifier; Type: TABLE DATA; Schema: otlo; Owner: postgres
--

COPY key_secondary_identifier (id, key_id, name, is_nfc, is_qr) FROM stdin;
\.


--
-- Name: key_secondary_identifier_id_seq; Type: SEQUENCE SET; Schema: otlo; Owner: postgres
--

SELECT pg_catalog.setval('key_secondary_identifier_id_seq', 2, true);


--
-- Data for Name: location; Type: TABLE DATA; Schema: otlo; Owner: postgres
--

COPY location (id, company_id, business_unit_id, name) FROM stdin;
1	1	1	MCC-2
2	1	1	A15
3	1	1	A21
4	1	1	A22
\.


--
-- Name: location_id_seq; Type: SEQUENCE SET; Schema: otlo; Owner: postgres
--

SELECT pg_catalog.setval('location_id_seq', 4, true);


--
-- Data for Name: lock; Type: TABLE DATA; Schema: otlo; Owner: postgres
--

COPY lock (id, company_id, lock_uid) FROM stdin;
1	1	121
\.


--
-- Name: lock_id_seq; Type: SEQUENCE SET; Schema: otlo; Owner: postgres
--

SELECT pg_catalog.setval('lock_id_seq', 1, true);


--
-- Data for Name: lock_secondary_identifier; Type: TABLE DATA; Schema: otlo; Owner: postgres
--

COPY lock_secondary_identifier (id, lock_id, name, is_nfc, is_qr) FROM stdin;
\.


--
-- Name: lock_secondary_identifier_id_seq; Type: SEQUENCE SET; Schema: otlo; Owner: postgres
--

SELECT pg_catalog.setval('lock_secondary_identifier_id_seq', 1, false);


--
-- Data for Name: pda; Type: TABLE DATA; Schema: otlo; Owner: postgres
--

COPY pda (id, employee_id, pda_id, token, signed_in) FROM stdin;
1	1	10001	5fbc8ccdeaec24c32f194c100aacdd9d	2017-05-06 00:39:26.463
3	3	10030	eaab21f696b4414547a193a911a0e724	2017-05-26 18:23:06.51
4	2	10029	d5442e0f213095624d53f8800569a913	2017-05-26 18:23:33.08
5	8	10024	c5cc41855bcfb8ba1db118bc1b1b8f96	2017-05-27 00:41:13.13
2	6	10004	084428f88727851f66abae24c708fa75	2017-07-13 01:50:58.541
\.


--
-- Name: pda_id_seq; Type: SEQUENCE SET; Schema: otlo; Owner: postgres
--

SELECT pg_catalog.setval('pda_id_seq', 5, true);


--
-- Data for Name: permission; Type: TABLE DATA; Schema: otlo; Owner: postgres
--

COPY permission (id, name, description, action_id) FROM stdin;
0	global	Global Company Control	0
1	company	Company Setup	1
2	company	Company Setup	2
3	company	Company Setup	3
4	company	Company Setup	4
5	company_resources	Employee + Department + Role Setup	1
6	company_resources	Employee + Department + Role Setup	2
7	company_resources	Employee + Department + Role Setup	3
8	company_resources	Employee + Department + Role Setup	4
9	elor	ELOR Setup	1
10	elor	ELOR Setup	2
11	elor	ELOR Setup	3
12	elor	ELOR Setup	4
13	elor	ELOR Setup	5
14	equip	Equipment Setup	1
15	equip	Equipment Setup	2
16	equip	Equipment Setup	3
17	equip	Equipment Setup	4
18	eplan	Event Planning Setup	1
19	eplan	Event Planning Setup	2
20	eplan	Event Planning Setup	3
21	eplan	Event Planning Setup	4
22	eplan	Event Planning Setup	5
23	Lock_Key	Lock + Key Setup	1
24	Lock_Key	Lock + Key Setup	2
25	Lock_Key	Lock + Key Setup	3
26	Lock_Key	Lock + Key Setup	4
27	adhoc	Ad-hoc Implementation	1
28	adhoc	Ad-hoc Implementation	2
29	adhoc	Ad-hoc Implementation	3
30	adhoc	Ad-hoc Implementation	4
31	adhoc	Ad-hoc Implementation	5
32	logs	Logs	3
33	logs	Logs	4
34	mobile	Mobile access	6
\.


--
-- Name: permission_id_seq; Type: SEQUENCE SET; Schema: otlo; Owner: postgres
--

SELECT pg_catalog.setval('permission_id_seq', 1, false);


--
-- Data for Name: report; Type: TABLE DATA; Schema: otlo; Owner: postgres
--

COPY report (id, company_id, name, report_type_id, report_status_id, process_type_id) FROM stdin;
75	1	test report setup	1	1	\N
76	1	test report setup	2	1	\N
77	1	New Report 02	2	1	\N
78	1	Report 03 Setup	1	1	\N
79	1	Report 03 Setup	2	1	\N
82	1	Report 04 only Shutdown	1	1	\N
\.


--
-- Data for Name: report_department; Type: TABLE DATA; Schema: otlo; Owner: postgres
--

COPY report_department (report_id, department_id) FROM stdin;
82	6
\.


--
-- Name: report_id_seq; Type: SEQUENCE SET; Schema: otlo; Owner: postgres
--

SELECT pg_catalog.setval('report_id_seq', 82, true);


--
-- Data for Name: report_instruction; Type: TABLE DATA; Schema: otlo; Owner: postgres
--

COPY report_instruction (report_id, instruction_id) FROM stdin;
82	29
82	26
\.


--
-- Data for Name: report_process_type; Type: TABLE DATA; Schema: otlo; Owner: postgres
--

COPY report_process_type (id, name) FROM stdin;
\.


--
-- Data for Name: report_role; Type: TABLE DATA; Schema: otlo; Owner: postgres
--

COPY report_role (role_id, report_id) FROM stdin;
3	82
\.


--
-- Data for Name: report_status; Type: TABLE DATA; Schema: otlo; Owner: postgres
--

COPY report_status (id, name) FROM stdin;
1	Available
2	In Progress
3	Completed
\.


--
-- Name: report_status_id_seq; Type: SEQUENCE SET; Schema: otlo; Owner: postgres
--

SELECT pg_catalog.setval('report_status_id_seq', 1, false);


--
-- Data for Name: report_type; Type: TABLE DATA; Schema: otlo; Owner: postgres
--

COPY report_type (id, name) FROM stdin;
2	Startup
1	Shutdown
\.


--
-- Name: report_type_id_seq; Type: SEQUENCE SET; Schema: otlo; Owner: postgres
--

SELECT pg_catalog.setval('report_type_id_seq', 1, false);


--
-- Data for Name: role; Type: TABLE DATA; Schema: otlo; Owner: postgres
--

COPY role (id, company_id, name) FROM stdin;
1	1	Global Admin
2	1	Coach
3	1	Field User
4	1	Equipment Specialist
5	1	Field Leader
6	1	Manager
\.


--
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: otlo; Owner: postgres
--

SELECT pg_catalog.setval('role_id_seq', 6, true);


--
-- Data for Name: role_permission; Type: TABLE DATA; Schema: otlo; Owner: postgres
--

COPY role_permission (role_id, permission_id) FROM stdin;
1	0
1	0
1	0
1	0
1	2
1	3
1	34
2	6
2	7
2	15
2	16
2	19
2	20
2	28
2	29
2	34
3	34
4	34
5	16
5	20
5	29
5	34
5	7
5	34
5	16
5	20
5	29
6	6
6	7
6	15
6	16
6	20
6	28
6	29
6	32
1	0
1	0
1	0
1	0
1	2
1	3
1	34
2	6
2	7
2	15
2	16
2	19
2	20
2	28
2	29
2	34
3	34
4	34
5	16
5	20
5	29
5	34
5	7
5	34
5	16
5	20
5	29
6	6
6	7
6	15
6	16
6	20
6	28
6	29
6	32
\.


--
-- Data for Name: sequence_group; Type: TABLE DATA; Schema: otlo; Owner: postgres
--

COPY sequence_group (id, sequence_type_id, unit_operation_id, instruction_id) FROM stdin;
3	2	2	1
6	2	3	26
7	2	3	27
8	3	1	22
9	3	1	23
10	2	2	31
12	1	2	25
13	1	3	20
14	1	3	21
15	1	2	24
17	2	4	30
18	2	4	29
19	1	5	32
20	1	5	33
22	2	1	34
23	3	2	35
\.


--
-- Name: sequence_group_id_seq; Type: SEQUENCE SET; Schema: otlo; Owner: postgres
--

SELECT pg_catalog.setval('sequence_group_id_seq', 23, true);


--
-- Data for Name: sequence_record; Type: TABLE DATA; Schema: otlo; Owner: postgres
--

COPY sequence_record (id, idx, equipment_id, description, sequence_group_id, preview_url) FROM stdin;
1	1	\N	Go to Area 21 to find Pump #4.	3	\N
2	2	3	Close input isolation valve {eq} and lock-out in closed position.	3	\N
3	3	4	Close output isolation valve {eq} and tag-out in closed position.	3	\N
4	4	6	Open drain valve {eq} to eliminate pump pressure, then tag-out.	3	\N
6	1	\N	Go to Pump #5 in Area 21.	6	\N
7	2	7	Close input isolation valve {eq} and lock-out.	6	\N
8	3	8	Close output isolation valve {eq} and tag-out in closed position.	6	\N
9	4	9	Open drain valve {eq} to eliminate pump pressure, then tag-out.	6	\N
10	1	\N	Go to Pump #5 in Area 21.	7	\N
11	2	9	Close drain valve {eq}, remove tag.	7	\N
13	4	7	Remove lock from {eq} on input side, then open isolation valve.	7	\N
14	1	\N	Go to MCC Room 2.	8	\N
15	2	1	Lock-out {eq}.	8	\N
16	3	2	Lock-out {eq}.	8	\N
17	4	18	Lock-out {eq}.	8	\N
18	1	\N	Go to MCC Room 2.	9	\N
19	2	1	Remove lock from {eq}.	9	\N
20	3	2	Remove lock from {eq}.	9	\N
21	4	18	Remove lock from {eq}.	9	\N
12	3	8	Remove tag from {eq} on output side, then open isolation valve.	7	\N
31	1	\N	Go to the flow control valve FCV-2138 in Area 21, near Pump #4.	12	\N
32	2	10	Open pneumatic supply valve {eq}, then remove tag.	12	\N
33	3	\N	Check FCV-2138 closes.	12	\N
34	4	11	Remove tag from {eq} and photo its closure.	12	\N
35	1	\N	Go to the flow control valve FCV-2139 in Area 21, near Pump #5.	13	\N
37	3	\N	Open bleed point to release pressure on FCV-2139.	13	\N
38	4	\N	Check FCV-2139 opens.	13	\N
39	5	14	Tag-out {eq} (FCV-2139) and photo FCV opening.	13	\N
40	1	\N	Go to the flow control valve FCV-2139 in Area 21, near Pump #5.	14	\N
41	2	13	Open pneumatic supply valve {eq} (V-2139), then remove tag.	14	\N
36	2	13	Close pneumatic supply valve {eq} (V-2139), then tag-out.	13	\N
42	3	\N	Check FCV-2139 closes.	14	\N
43	4	14	Remove tag from {eq} (FCV-2139) and photo its closure.	14	\N
25	4	3	Remove lock from {eq} on input side, then open isolation valve.	10	\N
44	1	\N	Go to the flow control valve FCV-2138 in Area 21, near Pump #4.	15	\N
45	2	10	Close pneumatic supply valve {eq}, then tag-out.	15	\N
46	3	\N	Open bleed point to release pressure on FCV-2138.	15	\N
47	4	\N	Check FCV-2138 opens.	15	\N
48	5	11	Tag-out {eq} and photo FCV opening.	15	\N
53	1	\N	Go to Pump #6 in Area 22.	17	\N
54	2	17	Close drain valve {eq}, remove tag.	17	\N
55	3	16	Remove tag from {eq} on output side, then open isolation valve.	17	\N
56	4	15	Remove tag from {eq} on input side, then open isolation valve.	17	\N
57	1	\N	Go to Pump #6 in Area 22.	18	\N
58	2	15	Close input isolation valve {eq} and lock-out in closed position.	18	\N
59	3	16	Close output isolation valve {eq} and tag-out in closed position.	18	\N
60	4	17	Open drain valve {eq} to eliminate pump pressure, then tag-out.	18	\N
61	1	\N	Go to MCC Room 2.	19	\N
62	2	1	Lock-out {eq}.	19	\N
63	3	\N	Go to Tank #1 in Area 15.	19	\N
64	4	12	Close tank isolation valve {eq} and tag-out.	19	\N
65	1	\N	Go to Tank #1 in Area 15.	20	\N
66	2	12	Open tank isolation valve {eq} and remove tag.	20	\N
67	3	\N	Go to MCC Room 2.	20	\N
68	4	1	Remove lock from {eq}.	20	\N
24	3	4	Remove tag {eq} on output side, then open isolation valve.	10	\N
22	1	\N	Go to Pump #4 in Area 21.	10	\N
23	2	6	Close drain valve {eq}, remove tag.	10	\N
69	1	19	cxc dnbdfnd test add instruction	22	\N
70	1	19	add new record instruction abrahim test	23	\N
\.


--
-- Name: sequence_record_id_seq; Type: SEQUENCE SET; Schema: otlo; Owner: postgres
--

SELECT pg_catalog.setval('sequence_record_id_seq', 70, true);


--
-- Data for Name: sequence_type; Type: TABLE DATA; Schema: otlo; Owner: postgres
--

COPY sequence_type (id, name) FROM stdin;
1	Random
2	Fixed
3	Geographic
\.


--
-- Name: sequence_type_id_seq; Type: SEQUENCE SET; Schema: otlo; Owner: postgres
--

SELECT pg_catalog.setval('sequence_type_id_seq', 1, false);


--
-- Data for Name: simple_log; Type: TABLE DATA; Schema: otlo; Owner: postgres
--

COPY simple_log (id, company_id, simple_log_type_id, description, created_at) FROM stdin;
\.


--
-- Name: simple_log_id_seq; Type: SEQUENCE SET; Schema: otlo; Owner: postgres
--

SELECT pg_catalog.setval('simple_log_id_seq', 1, false);


--
-- Data for Name: simple_log_type; Type: TABLE DATA; Schema: otlo; Owner: postgres
--

COPY simple_log_type (id, name) FROM stdin;
\.


--
-- Name: simple_log_type_id_seq; Type: SEQUENCE SET; Schema: otlo; Owner: postgres
--

SELECT pg_catalog.setval('simple_log_type_id_seq', 1, false);


--
-- Data for Name: unit_operation; Type: TABLE DATA; Schema: otlo; Owner: postgres
--

COPY unit_operation (id, company_id, location_id, name, diagram_link) FROM stdin;
1	1	1	Motor Control Center 2	
2	1	3	Boiler #1	
3	1	3	Boiler #2	
4	1	4	Tank #3	
5	1	2	Tank #1	122
\.


--
-- Name: unit_operation_id_seq; Type: SEQUENCE SET; Schema: otlo; Owner: postgres
--

SELECT pg_catalog.setval('unit_operation_id_seq', 6, true);


SET search_path = public, pg_catalog;

--
-- Data for Name: play_evolutions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY play_evolutions (id, hash, applied_at, apply_script, revert_script, state, last_problem) FROM stdin;
1	4381637dc22804eefa70436e7adb7735e20fc093	2017-04-29 19:51:26.998	CREATE SCHEMA otlo;\n\nCREATE TABLE otlo."action" (\nid                   serial  NOT NULL,\nname                 varchar(100)  NOT NULL,\nCONSTRAINT pk_action PRIMARY KEY ( id )\n);\n\nCREATE TABLE otlo.adhoc_status (\nid                   serial  NOT NULL,\nname                 varchar(100)  NOT NULL,\nCONSTRAINT pk_adhoc_status PRIMARY KEY ( id )\n);\n\nCREATE TABLE otlo.asset_type (\nid                   serial  NOT NULL,\nname                 varchar(100)  NOT NULL,\nCONSTRAINT pk_asset_type PRIMARY KEY ( id )\n);\n\n\nCREATE TABLE otlo.company (\nid                   serial  NOT NULL,\nname                 varchar(128)  NOT NULL,\naddress              varchar(128)  ,\ncity                 varchar(100)  ,\npostal               varchar(16)  ,\ncountry              varchar(100)  ,\nphone                varchar(32)  ,\nemail                varchar(256)  ,\ncreated_at           timestamp  ,\nCONSTRAINT pk_company PRIMARY KEY ( id ),\nCONSTRAINT idx_company_name UNIQUE ( name )\n);\n\nCREATE TABLE otlo.company_settings (\nid                   serial  NOT NULL,\ncompany_id           integer  NOT NULL,\n"key"                varchar(100)  NOT NULL,\n"value"              varchar(100)  NOT NULL,\nCONSTRAINT pk_company_settings PRIMARY KEY ( id ),\nCONSTRAINT fk_company_settings_company FOREIGN KEY ( company_id ) REFERENCES otlo.company( id )\n);\n\nCREATE INDEX idx_company_settings ON otlo.company_settings ( company_id );\n\nCREATE TABLE otlo.department (\nid                   serial  NOT NULL,\ncompany_id           integer  NOT NULL,\nname                 varchar(100)  NOT NULL,\nCONSTRAINT pk_department PRIMARY KEY ( id ),\nCONSTRAINT idx_department1 UNIQUE ( name, company_id ) ,\nCONSTRAINT fk_department_company FOREIGN KEY ( company_id ) REFERENCES otlo.company( id ) ON DELETE CASCADE\n);\n\nCREATE INDEX idx_department2 ON otlo.department ( company_id );\n\nCREATE TABLE otlo.equipment_status (\nid                   serial  NOT NULL,\nname                 varchar(100)  NOT NULL,\nCONSTRAINT pk_equipment_status PRIMARY KEY ( id )\n);\n\nCREATE TABLE otlo.event_mode (\nid                   serial  NOT NULL,\nname                 varchar(100)  NOT NULL,\nCONSTRAINT pk_event_mode PRIMARY KEY ( id )\n);\n\nCREATE TABLE otlo.event_status (\nid                   serial  NOT NULL,\nname                 varchar(100)  NOT NULL,\nCONSTRAINT pk_event_status PRIMARY KEY ( id )\n);\n\nCREATE TABLE otlo.event_type (\nid                   serial  NOT NULL,\nname                 varchar(100)  NOT NULL,\nCONSTRAINT pk_event_type PRIMARY KEY ( id )\n);\n\nCREATE TABLE otlo.instruction_type (\nid                   serial  NOT NULL,\nname                 varchar(100)  NOT NULL,\nCONSTRAINT pk_instruction_type PRIMARY KEY ( id )\n);\n\nCREATE TABLE otlo.key_association (\nid                   serial  NOT NULL,\nname                 varchar(100)  NOT NULL,\nCONSTRAINT pk_key_association PRIMARY KEY ( id )\n);\n\nCREATE TABLE otlo."lock" (\nid                   serial  NOT NULL,\ncompany_id           integer  NOT NULL,\nlock_uid             varchar(100)  NOT NULL,\nCONSTRAINT pk_lock PRIMARY KEY ( id ),\nCONSTRAINT idx_lock_0 UNIQUE ( company_id, lock_uid ) ,\nCONSTRAINT fk_lock_company FOREIGN KEY ( company_id ) REFERENCES otlo.company( id ) ON DELETE CASCADE\n);\n\nCREATE INDEX idx_lock ON otlo."lock" ( company_id );\n\nCREATE TABLE otlo.lock_secondary_identifier (\nid                   serial  NOT NULL,\nlock_id              integer  NOT NULL,\nname                 varchar(100)  NOT NULL,\nis_nfc               bool DEFAULT true NOT NULL,\nis_qr                bool DEFAULT false NOT NULL,\nCONSTRAINT pk_lock_secondary_identifier PRIMARY KEY ( id ),\nCONSTRAINT fk_lock_secondary_identifier FOREIGN KEY ( lock_id ) REFERENCES otlo."lock"( id ) ON DELETE CASCADE\n);\n\nCREATE INDEX idx_lock_secondary_identifier1 ON otlo.lock_secondary_identifier ( lock_id );\n\nCREATE TABLE otlo.permission (\nid                   serial  NOT NULL,\nname                 varchar(100)  NOT NULL,\ndescription          varchar(100)  NOT NULL,\naction_id            integer  NOT NULL,\nCONSTRAINT pk_permission PRIMARY KEY ( id ),\nCONSTRAINT fk_permission_action FOREIGN KEY ( action_id ) REFERENCES otlo."action"( id ) ON DELETE CASCADE\n);\n\nCREATE INDEX idx_permission ON otlo.permission ( action_id );\n\nCREATE TABLE otlo.report_status (\nid                   serial  NOT NULL,\nname                 varchar(100)  NOT NULL,\nCONSTRAINT pk_report_status PRIMARY KEY ( id )\n);\n\nCREATE TABLE otlo.report_type (\nid                   serial  NOT NULL,\nname                 varchar(100)  NOT NULL,\nCONSTRAINT pk_report_type PRIMARY KEY ( id )\n);\n\nCREATE TABLE otlo."role" (\nid                   serial  NOT NULL,\ncompany_id           integer  NOT NULL,\nname                 varchar(100)  NOT NULL,\nCONSTRAINT pk_role PRIMARY KEY ( id ),\nCONSTRAINT idx_role UNIQUE ( company_id, name ) ,\nCONSTRAINT fk_role_company FOREIGN KEY ( company_id ) REFERENCES otlo.company( id ) ON DELETE CASCADE\n);\n\nCREATE INDEX idx_role_0 ON otlo."role" ( company_id );\n\nCREATE TABLE otlo.role_permission (\nrole_id              integer  NOT NULL,\npermission_id        integer  NOT NULL,\nCONSTRAINT fk_role_permission_role FOREIGN KEY ( role_id ) REFERENCES otlo."role"( id ) ON DELETE CASCADE  ,\nCONSTRAINT fk_role_permission_permission FOREIGN KEY ( permission_id ) REFERENCES otlo.permission( id ) ON DELETE CASCADE\n);\n\nCREATE INDEX idx_role_permission1 ON otlo.role_permission ( role_id );\n\nCREATE INDEX idx_role_permission2 ON otlo.role_permission ( permission_id );\n\nCREATE TABLE otlo.sequence_type (\nid                   serial  NOT NULL,\nname                 varchar(100)  NOT NULL,\nCONSTRAINT pk_sequence_type PRIMARY KEY ( id )\n);\n\nCREATE TABLE otlo.simple_log_type (\nid                   serial  NOT NULL,\nname                 varchar(100)  NOT NULL,\nCONSTRAINT pk_simple_log_type PRIMARY KEY ( id )\n);\n\nCREATE TABLE otlo.business_unit (\nid                   serial  NOT NULL,\ncompany_id           integer  NOT NULL,\nname                 varchar(100)  NOT NULL,\nCONSTRAINT pk_business_unit PRIMARY KEY ( id ),\nCONSTRAINT fk_business_unit_company FOREIGN KEY ( company_id ) REFERENCES otlo.company( id ) ON DELETE CASCADE\n);\n\nCREATE INDEX idx_business_unit ON otlo.business_unit ( company_id );\n\nCREATE TABLE otlo.employee (\nid                   serial  NOT NULL,\ncompany_id           integer  NOT NULL,\nrole_id              integer  ,\ndepartment_id        integer  ,\nemployee_uid         varchar(100)  NOT NULL,\nfirst_name           varchar(100)  ,\nlast_name            varchar(100)  ,\nemail                varchar(100)  NOT NULL,\n"password"           varchar(100)  NOT NULL,\npda_pin              smallint  ,\nlast_activity        timestamp  ,\nphone                varchar  ,\nCONSTRAINT pk_employee PRIMARY KEY ( id ),\nCONSTRAINT idx_employee_2 UNIQUE ( company_id, employee_uid ) ,\nCONSTRAINT idx_employee_3 UNIQUE ( email ) ,\nCONSTRAINT fk_employee_company FOREIGN KEY ( company_id ) REFERENCES otlo.company( id ) ON DELETE CASCADE  ,\nCONSTRAINT fk_employee_department FOREIGN KEY ( department_id ) REFERENCES otlo.department( id )    ,\nCONSTRAINT fk_employee_role FOREIGN KEY ( role_id ) REFERENCES otlo."role"( id )\n);\n\nCREATE INDEX idx_employee ON otlo.employee ( company_id );\n\nCREATE INDEX idx_employee_0 ON otlo.employee ( department_id );\n\nCREATE INDEX idx_employee_1 ON otlo.employee ( role_id );\n\nCREATE TABLE otlo.employee_secondary_identifier (\nid                   serial  NOT NULL,\nemployee_id          integer  NOT NULL,\nname                 varchar(100)  NOT NULL,\nis_nfc               bool DEFAULT true NOT NULL,\nis_qr                bool DEFAULT false NOT NULL,\nCONSTRAINT pk_employee_secondary_identifier PRIMARY KEY ( id ),\nCONSTRAINT fk_employee_secondary_identifier FOREIGN KEY ( employee_id ) REFERENCES otlo.employee( id ) ON DELETE CASCADE\n);\n\nCREATE INDEX idx_employee_secondary_identifier1 ON otlo.employee_secondary_identifier ( employee_id );\n\nCREATE TABLE otlo.event (\nid                   serial  NOT NULL,\ncompany_id           integer  NOT NULL,\nevent_type_id        integer  NOT NULL,\nevent_status_id      integer  NOT NULL,\nevent_mode_id        integer  NOT NULL,\nname                 varchar(100)  NOT NULL,\nrepeat               integer DEFAULT 0 NOT NULL,\nscheduled_at         timestamp  NOT NULL,\nstarted_at           timestamp  ,\ncompleted_at         timestamp  ,\nnotification         varchar(256)  ,\nscheduled_by \t\t integer,\nignore_keys \t\t bool DEFAULT false NOT NULL,\nCONSTRAINT pk_event PRIMARY KEY ( id ),\nCONSTRAINT fk_event_company FOREIGN KEY ( company_id ) REFERENCES otlo.company( id ) ON DELETE CASCADE  ,\nCONSTRAINT fk_event_event_mode FOREIGN KEY ( event_mode_id ) REFERENCES otlo.event_mode( id )    ,\nCONSTRAINT fk_event_event_status FOREIGN KEY ( event_status_id ) REFERENCES otlo.event_status( id )    ,\nCONSTRAINT fk_event_event_type FOREIGN KEY ( event_type_id ) REFERENCES otlo.event_type( id ),\nCONSTRAINT fk_event_employee1 FOREIGN KEY (scheduled_by) REFERENCES otlo.employee(id) ON DELETE SET NULL\n\n);\n\nCREATE INDEX idx_event1 ON otlo.event ( company_id );\n\nCREATE INDEX idx_event2 ON otlo.event ( event_mode_id );\n\nCREATE INDEX idx_event3 ON otlo.event ( event_status_id );\n\nCREATE INDEX idx_event4 ON otlo.event ( event_type_id );\n\nCREATE TABLE otlo.instruction (\nid                   serial  NOT NULL,\nname                 varchar(100)  NOT NULL,\ncompany_id           integer  NOT NULL,\ninstruction_type_id  integer DEFAULT 1 NOT NULL,\nis_adhoc_default     bool DEFAULT false NOT NULL,\nCONSTRAINT pk_instruction PRIMARY KEY ( id ),\nCONSTRAINT idx_instruction_0 UNIQUE ( company_id, name ) ,\nCONSTRAINT fk_instruction_company FOREIGN KEY ( company_id ) REFERENCES otlo.company( id ) ON DELETE CASCADE  ,\nCONSTRAINT fk_instruction FOREIGN KEY ( instruction_type_id ) REFERENCES otlo.instruction_type( id )\n);\n\nCREATE INDEX idx_instruction ON otlo.instruction ( company_id );\n\nCREATE INDEX idx_instruction_1 ON otlo.instruction ( instruction_type_id );\n\nCREATE TABLE otlo."key" (\nid                   serial  NOT NULL,\ncompany_id           integer  NOT NULL,\nkey_uid              varchar(100)  NOT NULL,\nkey_assoc_type_id    integer DEFAULT 1 NOT NULL,\nkey_association_id   integer  ,\ndepartment_id        integer  ,\nCONSTRAINT pk_key PRIMARY KEY ( id ),\nCONSTRAINT idx_key_1 UNIQUE ( company_id, key_uid ) ,\nCONSTRAINT fk_key_company FOREIGN KEY ( company_id ) REFERENCES otlo.company( id ) ON DELETE CASCADE  ,\nCONSTRAINT fk_key_key_association FOREIGN KEY ( key_assoc_type_id ) REFERENCES otlo.key_association( id )\n);\n\nCREATE INDEX idx_key ON otlo."key" ( company_id );\n\nCREATE INDEX idx_key_0 ON otlo."key" ( key_assoc_type_id );\n\nCREATE TABLE otlo.key_lock (\nkey_id               integer  NOT NULL,\nlock_id              integer  NOT NULL,\nCONSTRAINT fk_key_lock_key FOREIGN KEY ( key_id ) REFERENCES otlo."key"( id ) ON DELETE CASCADE  ,\nCONSTRAINT fk_key_lock_lock FOREIGN KEY ( lock_id ) REFERENCES otlo."lock"( id ) ON DELETE CASCADE\n);\n\nCREATE INDEX idx_key_lock1 ON otlo.key_lock ( key_id );\n\nCREATE INDEX idx_key_lock2 ON otlo.key_lock ( lock_id );\n\nCREATE TABLE otlo.key_secondary_identifier (\nid                   serial  NOT NULL,\nkey_id               integer  NOT NULL,\nname                 varchar(100)  NOT NULL,\nis_nfc               bool DEFAULT true NOT NULL,\nis_qr                bool  NOT NULL,\nCONSTRAINT pk_key_secondary_identifier PRIMARY KEY ( id ),\nCONSTRAINT fk_key_secondary_identifier FOREIGN KEY ( key_id ) REFERENCES otlo."key"( id ) ON DELETE CASCADE\n);\n\nCREATE INDEX idx_key_secondary_identifier1 ON otlo.key_secondary_identifier ( key_id );\n\nCREATE TABLE otlo."location" (\nid                   serial  NOT NULL,\ncompany_id           integer  NOT NULL,\nbusiness_unit_id     integer  NOT NULL,\nname                 varchar(100)  NOT NULL,\nCONSTRAINT pk_location PRIMARY KEY ( id ),\nCONSTRAINT fk_location_company FOREIGN KEY ( company_id ) REFERENCES otlo.company( id ) ON DELETE CASCADE  ,\nCONSTRAINT fk_location_business_unit FOREIGN KEY ( business_unit_id ) REFERENCES otlo.business_unit( id )\n);\n\nCREATE INDEX idx_location1 ON otlo."location" ( company_id );\n\nCREATE INDEX idx_location2 ON otlo."location" ( business_unit_id );\n\nCREATE TABLE otlo.pda (\nid                   serial  NOT NULL,\nemployee_id          integer  NOT NULL,\npda_id               varchar(256)  NOT NULL,\ntoken                varchar(256)  NOT NULL,\nsigned_in            timestamp  ,\nCONSTRAINT pk_pda PRIMARY KEY ( id ),\nCONSTRAINT idx_pda_0 UNIQUE ( pda_id ) ,\nCONSTRAINT fk_pda_employee FOREIGN KEY ( employee_id ) REFERENCES otlo.employee( id ) ON DELETE CASCADE\n);\n\nCREATE INDEX idx_pda ON otlo.pda ( employee_id );\n\nCREATE TABLE otlo.report_process_type (\nid \t\t\tinteger NOT NULL,\nname \t\tvarchar(100) NOT NULL,\nCONSTRAINT pk_report_process_type PRIMARY KEY (id)\n);\n\nCREATE TABLE otlo.report (\nid                   serial  NOT NULL,\ncompany_id           integer  NOT NULL,\nname                 varchar(100)  NOT NULL,\nreport_type_id       integer  NOT NULL,\nreport_status_id     integer  ,\nprocess_type_id\t\t integer,\nCONSTRAINT pk_report PRIMARY KEY ( id ),\nCONSTRAINT idx_report UNIQUE ( company_id, name ) ,\nCONSTRAINT fk_report_company FOREIGN KEY ( company_id ) REFERENCES otlo.company( id ) ON DELETE CASCADE  ,\nCONSTRAINT fk_report_report_status FOREIGN KEY ( report_status_id ) REFERENCES otlo.report_status( id )    ,\nCONSTRAINT fk_report_report_type FOREIGN KEY ( report_type_id ) REFERENCES otlo.report_type( id ),\nCONSTRAINT fk_report_report_process_type FOREIGN KEY (process_type_id) REFERENCES otlo.report_process_type(id) ON DELETE SET NULL\n);\n\nCREATE INDEX idx_report_0 ON otlo.report ( company_id );\n\nCREATE INDEX idx_report_1 ON otlo.report ( report_status_id );\n\nCREATE INDEX idx_report_2 ON otlo.report ( report_type_id );\n\nCREATE TABLE otlo.report_instruction (\nreport_id \t\tinteger NOT NULL,\ninstruction_id \tinteger NOT NULL,\nCONSTRAINT fk_report_instruction1 FOREIGN KEY (instruction_id) REFERENCES otlo.instruction(id) ON DELETE CASCADE,\nCONSTRAINT fk_report_instruction_report FOREIGN KEY (report_id) REFERENCES otlo.report(id) ON DELETE CASCADE,\nCONSTRAINT idx_report_instruction_01 PRIMARY KEY (report_id, instruction_id)\n);\n\n\n\nCREATE TABLE otlo.report_department (\nreport_id            integer  NOT NULL,\ndepartment_id        integer  NOT NULL,\nCONSTRAINT fk_report_department FOREIGN KEY ( department_id ) REFERENCES otlo.department( id ) ON DELETE CASCADE  ,\nCONSTRAINT fk_report_department_report FOREIGN KEY ( report_id ) REFERENCES otlo.report( id ) ON DELETE CASCADE\n);\n\nCREATE INDEX idx_report_department1 ON otlo.report_department ( department_id );\n\nCREATE INDEX idx_report_department2 ON otlo.report_department ( report_id );\n\nCREATE TABLE otlo.report_role (\nrole_id              integer  NOT NULL,\nreport_id            integer  NOT NULL,\nCONSTRAINT fk_report_role_role FOREIGN KEY ( role_id ) REFERENCES otlo."role"( id ) ON DELETE CASCADE  ,\nCONSTRAINT fk_report_role_report FOREIGN KEY ( report_id ) REFERENCES otlo.report( id ) ON DELETE CASCADE\n);\n\nCREATE INDEX idx_report_role1 ON otlo.report_role ( role_id );\n\nCREATE INDEX idx_report_role2 ON otlo.report_role ( report_id );\n\nCREATE TABLE otlo.simple_log (\nid                   serial  NOT NULL,\ncompany_id           integer  NOT NULL,\nsimple_log_type_id   integer  NOT NULL,\ndescription          varchar(256)  NOT NULL,\ncreated_at           timestamp  NOT NULL,\nCONSTRAINT pk_simple_log PRIMARY KEY ( id ),\nCONSTRAINT fk_simple_log_company FOREIGN KEY ( company_id ) REFERENCES otlo.company( id ) ON DELETE CASCADE  ,\nCONSTRAINT fk_simple_log_simple_log_type FOREIGN KEY ( simple_log_type_id ) REFERENCES otlo.simple_log_type( id )\n);\n\nCREATE INDEX idx_simple_log ON otlo.simple_log ( company_id );\n\nCREATE INDEX idx_simple_log_0 ON otlo.simple_log ( simple_log_type_id );\n\nCREATE TABLE otlo.unit_operation (\nid                   serial  NOT NULL,\ncompany_id           integer  NOT NULL,\nlocation_id          integer  NOT NULL,\nname                 varchar(100)  NOT NULL,\ndiagram_link         varchar(256)  ,\nCONSTRAINT pk_unit_operation PRIMARY KEY ( id ),\nCONSTRAINT fk_unit_operation_company FOREIGN KEY ( company_id ) REFERENCES otlo.company( id ) ON DELETE CASCADE  ,\nCONSTRAINT fk_unit_operation_location FOREIGN KEY ( location_id ) REFERENCES otlo."location"( id )\n);\n\nCREATE INDEX idx_unit_operation1 ON otlo.unit_operation ( company_id );\n\nCREATE INDEX idx_unit_operation2 ON otlo.unit_operation ( location_id );\n\n\nCREATE TABLE otlo.equipment_type (\nid \t\tinteger NOT NULL,\nname  \tvarchar(100) NOT NULL,\nCONSTRAINT pk_equipment_type_id PRIMARY KEY (id)\n);\n\nCREATE TABLE otlo.equipment (\nid                   serial  NOT NULL,\nequipment_uid        varchar(100)  NOT NULL,\nname                 varchar(100)  ,\ncompany_id           integer  NOT NULL,\nphoto                bool DEFAULT true NOT NULL,\naudio                bool DEFAULT false NOT NULL,\nis_locked            bool DEFAULT false NOT NULL,\nis_tagged            bool DEFAULT false NOT NULL,\nstatus_id            integer  NOT NULL,\nunit_operation_id    integer  ,\nupdated_at           timestamp  ,\ntype_id   \t\t\t integer  NOT NULL,\nauxiliary_id \t\t integer,\nis_aux \t\t\t\tbool DEFAULT false,\nCONSTRAINT pk_equipment PRIMARY KEY ( id ),\nCONSTRAINT idx_equipment_0 UNIQUE ( company_id, equipment_uid ) ,\nCONSTRAINT fk_equipment_unit_operation FOREIGN KEY ( unit_operation_id ) REFERENCES otlo.unit_operation( id )    ,\nCONSTRAINT fk_equipment_company FOREIGN KEY ( company_id ) REFERENCES otlo.company( id ) ON DELETE CASCADE  ,\nCONSTRAINT fk_equipment_equipment_status FOREIGN KEY ( status_id ) REFERENCES otlo.equipment_status( id ),\nCONSTRAINT fk_equipment_equipment_type FOREIGN KEY (type_id) REFERENCES otlo.equipment_type(id) ON DELETE CASCADE,\nCONSTRAINT equipment_auxiliary_id_fkey FOREIGN KEY (auxiliary_id) REFERENCES otlo.equipment(id)\n);\n\nCREATE TABLE otlo.auxiliary_equipment (\nequipment_id \t\tinteger NOT NULL,\nauxiliary_equipment_id \t\tinteger NOT NULL,\nCONSTRAINT auxiliary_equipment_equipment_id2_fk FOREIGN KEY (auxiliary_equipment_id) REFERENCES otlo.equipment(id)\n,\nCONSTRAINT auxiliary_equipment_equipment_id_auxiliary_equipment_id_pk PRIMARY KEY (equipment_id, auxiliary_equipment_id)\n,\nCONSTRAINT auxiliary_equipment_equipment_id_fk FOREIGN KEY (equipment_id) REFERENCES otlo.equipment(id)\n);\n\nCREATE INDEX idx_equipment3 ON otlo.equipment ( unit_operation_id );\n\nCREATE INDEX idx_equipment2 ON otlo.equipment ( company_id );\n\nCREATE INDEX idx_equipment_1 ON otlo.equipment ( status_id );\n\nCREATE TABLE otlo.equipment_active_locks (\nid                   serial  NOT NULL,\ncompany_id           integer  NOT NULL,\nequipment_id         integer  NOT NULL,\nlock_id              integer  ,\nkey_id               integer  ,\nCONSTRAINT pk_equipment_active_locks PRIMARY KEY ( id ),\nCONSTRAINT fk_equipment_active_locks FOREIGN KEY ( company_id ) REFERENCES otlo.company( id ) ON DELETE CASCADE  ,\nCONSTRAINT fk_equipment_active_locks1 FOREIGN KEY ( equipment_id ) REFERENCES otlo.equipment( id ) ON DELETE CASCADE  ,\nCONSTRAINT fk_equipment_active_locks_lock FOREIGN KEY ( lock_id ) REFERENCES otlo."lock"( id )    ,\nCONSTRAINT fk_equipment_active_locks_key FOREIGN KEY ( key_id ) REFERENCES otlo."key"( id )\n);\n\nCREATE INDEX idx_equipment_active_locks1 ON otlo.equipment_active_locks ( company_id );\n\nCREATE INDEX idx_equipment_active_locks2 ON otlo.equipment_active_locks ( equipment_id );\n\nCREATE INDEX idx_equipment_active_locks3 ON otlo.equipment_active_locks ( lock_id );\n\nCREATE INDEX idx_equipment_active_locks4 ON otlo.equipment_active_locks ( key_id );\n\nCREATE TABLE otlo.equipment_asset (\nid                   serial  NOT NULL,\nequipment_id         integer  NOT NULL,\nasset_type_id        integer  NOT NULL,\nname                 varchar(100)  ,\nurl                  varchar(256)  ,\nhash\t\t\t\tvarchar(100),\nCONSTRAINT pk_equipment_asset PRIMARY KEY ( id ),\nCONSTRAINT fk_equipment_asset_equipment FOREIGN KEY ( equipment_id ) REFERENCES otlo.equipment( id ) ON DELETE CASCADE  ,\nCONSTRAINT fk_equipment_asset_asset_type FOREIGN KEY ( asset_type_id ) REFERENCES otlo.asset_type( id )\n);\n\nCREATE INDEX idx_equipment_asset ON otlo.equipment_asset ( equipment_id );\n\nCREATE INDEX idx_equipment_asset_0 ON otlo.equipment_asset ( asset_type_id );\n\nCREATE TABLE otlo.equipment_secondary_identifier (\nid                   serial  NOT NULL,\nequipment_id         integer  NOT NULL,\nname                 varchar(100)  NOT NULL,\nis_auxiliary         bool DEFAULT false NOT NULL,\nis_nfc               bool DEFAULT true NOT NULL,\nis_qr                bool DEFAULT true NOT NULL,\nCONSTRAINT pk_equipment_secondary_identifier PRIMARY KEY ( id ),\nCONSTRAINT fk_equipment_secondary_identifier FOREIGN KEY ( equipment_id ) REFERENCES otlo.equipment( id ) ON DELETE CASCADE\n);\n\nCREATE INDEX idx_equipment_secondary_identifier1 ON otlo.equipment_secondary_identifier ( equipment_id );\n\nCREATE TABLE otlo.event_report (\nid                   serial  NOT NULL,\nevent_id             integer  NOT NULL,\nreport_id            integer  NOT NULL,\nnormal_process_by    integer  ,\nverification_process_by integer  ,\nnormal_started_at    timestamp  ,\nnormal_completed_at  timestamp  ,\nverification_started_at timestamp  ,\nverification_completed_at timestamp  ,\nis_normal            bool DEFAULT true NOT NULL,\nis_verification      bool DEFAULT false NOT NULL,\nignore_keys\t\t\tbool DEFAULT false NOT NULL,\nCONSTRAINT pk_event_report PRIMARY KEY ( id ),\nCONSTRAINT fk_event_report_event FOREIGN KEY ( event_id ) REFERENCES otlo.event( id ) ON DELETE CASCADE  ,\nCONSTRAINT fk_event_report_report FOREIGN KEY ( report_id ) REFERENCES otlo.report( id ) ON DELETE CASCADE\n);\n\nCREATE INDEX idx_event_report1 ON otlo.event_report ( event_id );\n\nCREATE INDEX idx_event_report2 ON otlo.event_report ( report_id );\n\nCREATE TABLE otlo.event_report_data (\nid                   serial  NOT NULL,\nevent_report_id      integer  NOT NULL,\nequipment_id         integer  NOT NULL,\nis_enabled           bool DEFAULT true NOT NULL,\nis_normal_completed  bool DEFAULT false NOT NULL,\nis_verification_completed bool DEFAULT false NOT NULL,\nCONSTRAINT pk_event_report_data PRIMARY KEY ( id ),\nCONSTRAINT fk_event_report_data FOREIGN KEY ( event_report_id ) REFERENCES otlo.event_report( id ) ON DELETE CASCADE  ,\nCONSTRAINT fk_event_report_data_equipment FOREIGN KEY ( equipment_id ) REFERENCES otlo.equipment( id )\n);\n\nCREATE INDEX idx_event_report_data ON otlo.event_report_data ( event_report_id );\n\nCREATE INDEX idx_event_report_data_0 ON otlo.event_report_data ( equipment_id );\n\nCREATE TABLE otlo.event_report_data_log (\nid                   serial  NOT NULL,\ncompany_id           integer  NOT NULL,\nevent_report_data_id integer  NOT NULL,\nphoto_link           varchar(256)  ,\naudio_link           varchar(256)  ,\nemployee_id          integer  ,\nequipment_id         integer  ,\ncreated_at           timestamp  NOT NULL,\n"key" \t\t\t\t integer,\nlock \t\t\t\t integer,\nprocess_type \t\t integer NOT NULL,\nsuccess \t\t\t bool DEFAULT true NOT NULL,\nCONSTRAINT pk_event_report_data_log PRIMARY KEY ( id ),\nCONSTRAINT fk_event_report_data_log FOREIGN KEY ( event_report_data_id ) REFERENCES otlo.event_report_data( id )    ,\nCONSTRAINT fk_event_report_data_log1 FOREIGN KEY ( employee_id ) REFERENCES otlo.employee( id )    ,\nCONSTRAINT fk_event_report_data_log3 FOREIGN KEY ( equipment_id ) REFERENCES otlo.equipment( id )    ,\nCONSTRAINT fk_event_report_data_log4 FOREIGN KEY ( company_id ) REFERENCES otlo.company( id ) ON DELETE CASCADE,\n\nCONSTRAINT fk_event_report_data_log_key FOREIGN KEY (key) REFERENCES otlo.key(id) ON DELETE SET NULL,\nCONSTRAINT fk_event_report_data_log_lock FOREIGN KEY (lock) REFERENCES otlo.lock(id) ON DELETE SET NULL\n);\n\nCREATE INDEX idx_event_report_data_log1 ON otlo.event_report_data_log ( event_report_data_id );\n\nCREATE INDEX idx_event_report_data_log3 ON otlo.event_report_data_log ( employee_id );\n\nCREATE INDEX idx_event_report_data_log2 ON otlo.event_report_data_log ( equipment_id );\n\nCREATE INDEX idx_event_report_data_log_0 ON otlo.event_report_data_log ( company_id );\n\nCREATE TABLE otlo.sequence_group (\nid                   serial  NOT NULL,\nsequence_type_id     integer DEFAULT 1 NOT NULL,\nunit_operation_id    integer  NOT NULL,\ninstruction_id       integer  NOT NULL,\nCONSTRAINT pk_sequence_group PRIMARY KEY ( id ),\nCONSTRAINT fk_sequence_group FOREIGN KEY ( sequence_type_id ) REFERENCES otlo.sequence_type( id ) ON DELETE CASCADE  ,\nCONSTRAINT fk_sequence_group1 FOREIGN KEY ( unit_operation_id ) REFERENCES otlo.unit_operation( id ) ON DELETE CASCADE  ,\nCONSTRAINT fk_sequence_group_instruction FOREIGN KEY ( instruction_id ) REFERENCES otlo.instruction( id ) ON DELETE CASCADE\n);\n\nCREATE INDEX idx_sequence_group1 ON otlo.sequence_group ( sequence_type_id );\n\nCREATE INDEX idx_sequence_group2 ON otlo.sequence_group ( unit_operation_id );\n\nCREATE INDEX idx_sequence_group_0 ON otlo.sequence_group ( instruction_id );\n\nCREATE TABLE otlo.sequence_record (\nid                   serial  NOT NULL,\nidx                  integer DEFAULT -1 NOT NULL,\nequipment_id         integer  ,\ndescription          varchar(256)  NOT NULL,\nsequence_group_id    integer  NOT NULL,\npreview_url \t\t varchar(255),\nCONSTRAINT pk_sequence_record PRIMARY KEY ( id ),\nCONSTRAINT fk_sequence_record FOREIGN KEY ( sequence_group_id ) REFERENCES otlo.sequence_group( id ) ON DELETE CASCADE,\nCONSTRAINT fk_sequence_record_equipment FOREIGN KEY (equipment_id) REFERENCES otlo.equipment(id) ON DELETE SET NULL\n);\n\nCREATE INDEX idx_sequence_record ON otlo.sequence_record ( sequence_group_id );\n\nCREATE TABLE otlo.adhoc_type (\nid                   serial  NOT NULL,\nname                 varchar(100)  NOT NULL,\nCONSTRAINT adhoc_type_pkey PRIMARY KEY (id)\n);\n\nCREATE TABLE otlo.adhoc (\nid                   serial  NOT NULL,\ncompany_id           integer  NOT NULL,\nequipment_id         integer  NOT NULL,\nevent_id             integer  ,\nrequested_by         integer  NOT NULL,\nrequested_at         timestamp  NOT NULL,\ninspected_by         integer  ,\nadhoc_status_id      integer  NOT NULL,\nadhoc_type_id      integer  NOT NULL,\nauxiliary_equipment_id         integer  ,\nauxiliary_equipment_type_id         integer  ,\ncreated_at           timestamp,\ninspected_at         timestamp  ,\nimage\t\t\t\tvarchar(255),\n"comment"            varchar(256)  ,\nCONSTRAINT pk_adhoc PRIMARY KEY ( id ),\nCONSTRAINT fk_adhoc_company FOREIGN KEY ( company_id ) REFERENCES otlo.company( id ) ON DELETE CASCADE  ,\nCONSTRAINT fk_adhoc_equipment FOREIGN KEY ( equipment_id ) REFERENCES otlo.equipment( id )    ,\nCONSTRAINT fk_adhoc_adhoc_status FOREIGN KEY ( adhoc_status_id ) REFERENCES otlo.adhoc_status( id )    ,\nCONSTRAINT fk_adhoc_event FOREIGN KEY ( event_id ) REFERENCES otlo.event( id ),\nCONSTRAINT adhoc_adhoc_type_id_fkey\tFOREIGN KEY (adhoc_type_id) REFERENCES otlo.adhoc_type(id),\nCONSTRAINT adhoc_auxiliary_equipment_id_fkey FOREIGN KEY (auxiliary_equipment_id) REFERENCES otlo.equipment(id),\nCONSTRAINT adhoc_equipment_id_fk FOREIGN KEY (auxiliary_equipment_id) REFERENCES otlo.equipment(id) ON UPDATE SET NULL ON DELETE SET NULL\n);\n\nCREATE INDEX idx_adhoc2 ON otlo.adhoc ( company_id );\n\nCREATE INDEX idx_adhoc1 ON otlo.adhoc ( equipment_id );\n\nCREATE INDEX idx_adhoc_0 ON otlo.adhoc ( adhoc_status_id );\n\nCREATE INDEX idx_adhoc_1 ON otlo.adhoc ( event_id );		applied	
2	2fb9a0962c05834cb8a14071fd538493d100e7c1	2017-04-29 19:51:27.412	-- Company\nINSERT INTO otlo.Company\nVALUES\n(1, 'Chocolate Factory', 'Nowhere', 'Some City', '111222', 'Cote d''Ivoire', '+1 111 111 1111', 'willy@wonka.net',\n'01-01-1999');\n\n-- Roles\nINSERT INTO otlo.Role VALUES (1, 1, 'Global Admin');\n\n-- Actions\nINSERT INTO otlo.Action VALUES (0, 'global');\nINSERT INTO otlo.Action VALUES (1, 'create');\nINSERT INTO otlo.Action VALUES (2, 'edit');\nINSERT INTO otlo.Action VALUES (3, 'view');\nINSERT INTO otlo.Action VALUES (4, 'delete');\nINSERT INTO otlo.Action VALUES (5, 'control');\nINSERT INTO otlo.Action VALUES (6, 'mobile');\n\n-- Permissions\nINSERT INTO otlo.Permission VALUES (0, 'global', 'Global Company Control', 0);\n\nINSERT INTO otlo.Permission VALUES (1, 'company', 'Company Setup', 1);\nINSERT INTO otlo.Permission VALUES (2, 'company', 'Company Setup', 2);\nINSERT INTO otlo.Permission VALUES (3, 'company', 'Company Setup', 3);\nINSERT INTO otlo.Permission VALUES (4, 'company', 'Company Setup', 4);\n\nINSERT INTO otlo.Permission VALUES (5, 'company_resources', 'Employee + Department + Role Setup', 1);\nINSERT INTO otlo.Permission VALUES (6, 'company_resources', 'Employee + Department + Role Setup', 2);\nINSERT INTO otlo.Permission VALUES (7, 'company_resources', 'Employee + Department + Role Setup', 3);\nINSERT INTO otlo.Permission VALUES (8, 'company_resources', 'Employee + Department + Role Setup', 4);\n\nINSERT INTO otlo.Permission VALUES (9, 'elor', 'ELOR Setup', 1);\nINSERT INTO otlo.Permission VALUES (10, 'elor', 'ELOR Setup', 2);\nINSERT INTO otlo.Permission VALUES (11, 'elor', 'ELOR Setup', 3);\nINSERT INTO otlo.Permission VALUES (12, 'elor', 'ELOR Setup', 4);\nINSERT INTO otlo.Permission VALUES (13, 'elor', 'ELOR Setup', 5);\n\nINSERT INTO otlo.Permission VALUES (14, 'equip', 'Equipment Setup', 1);\nINSERT INTO otlo.Permission VALUES (15, 'equip', 'Equipment Setup', 2);\nINSERT INTO otlo.Permission VALUES (16, 'equip', 'Equipment Setup', 3);\nINSERT INTO otlo.Permission VALUES (17, 'equip', 'Equipment Setup', 4);\n\nINSERT INTO otlo.Permission VALUES (18, 'eplan', 'Event Planning Setup', 1);\nINSERT INTO otlo.Permission VALUES (19, 'eplan', 'Event Planning Setup', 2);\nINSERT INTO otlo.Permission VALUES (20, 'eplan', 'Event Planning Setup', 3);\nINSERT INTO otlo.Permission VALUES (21, 'eplan', 'Event Planning Setup', 4);\nINSERT INTO otlo.Permission VALUES (22, 'eplan', 'Event Planning Setup', 5);\n\nINSERT INTO otlo.Permission VALUES (23, 'Lock_Key', 'Lock + Key Setup', 1);\nINSERT INTO otlo.Permission VALUES (24, 'Lock_Key', 'Lock + Key Setup', 2);\nINSERT INTO otlo.Permission VALUES (25, 'Lock_Key', 'Lock + Key Setup', 3);\nINSERT INTO otlo.Permission VALUES (26, 'Lock_Key', 'Lock + Key Setup', 4);\n\nINSERT INTO otlo.Permission VALUES (27, 'adhoc', 'Ad-hoc Implementation', 1);\nINSERT INTO otlo.Permission VALUES (28, 'adhoc', 'Ad-hoc Implementation', 2);\nINSERT INTO otlo.Permission VALUES (29, 'adhoc', 'Ad-hoc Implementation', 3);\nINSERT INTO otlo.Permission VALUES (30, 'adhoc', 'Ad-hoc Implementation', 4);\nINSERT INTO otlo.Permission VALUES (31, 'adhoc', 'Ad-hoc Implementation', 5);\n\nINSERT INTO otlo.Permission VALUES (32, 'logs', 'Logs', 3);\nINSERT INTO otlo.Permission VALUES (33, 'logs', 'Logs', 4);\n\nINSERT INTO otlo.Permission VALUES (34, 'mobile', 'Mobile access', 6);\n\n-- Role Permission\nINSERT INTO otlo.Role_Permission VALUES (1, 0);\n\n-- Department\nINSERT INTO otlo.Department VALUES (1, 1, 'Department 1');\n\n-- Employee\nINSERT INTO otlo.Employee\nVALUES (1, 1, 1, 1, '#1', 'first_name', 'last_name', 'a@a.com', '12345678', 1234, '01-01-1999', 'phone');\n\n-- Asset Type\nINSERT INTO otlo.Asset_Type VALUES (1, 'document');\nINSERT INTO otlo.Asset_Type VALUES (2, 'image');\nINSERT INTO otlo.Asset_Type VALUES (3, 'link');\n\n-- Equipment status\nINSERT INTO otlo.Equipment_Status VALUES (1, 'enabled');\nINSERT INTO otlo.Equipment_Status VALUES (2, 'adhoc');\nINSERT INTO otlo.Equipment_Status VALUES (3, 'disabled');		applied	
\.


SET search_path = otlo, pg_catalog;

--
-- Name: adhoc_type_pkey; Type: CONSTRAINT; Schema: otlo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY adhoc_type
    ADD CONSTRAINT adhoc_type_pkey PRIMARY KEY (id);


--
-- Name: auxiliary_equipment_equipment_id_auxiliary_equipment_id_pk; Type: CONSTRAINT; Schema: otlo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auxiliary_equipment
    ADD CONSTRAINT auxiliary_equipment_equipment_id_auxiliary_equipment_id_pk PRIMARY KEY (equipment_id, auxiliary_equipment_id);


--
-- Name: idx_company_name; Type: CONSTRAINT; Schema: otlo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY company
    ADD CONSTRAINT idx_company_name UNIQUE (name);


--
-- Name: idx_department1; Type: CONSTRAINT; Schema: otlo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY department
    ADD CONSTRAINT idx_department1 UNIQUE (name, company_id);


--
-- Name: idx_employee_2; Type: CONSTRAINT; Schema: otlo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY employee
    ADD CONSTRAINT idx_employee_2 UNIQUE (company_id, employee_uid);


--
-- Name: idx_employee_3; Type: CONSTRAINT; Schema: otlo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY employee
    ADD CONSTRAINT idx_employee_3 UNIQUE (email);


--
-- Name: idx_equipment_0; Type: CONSTRAINT; Schema: otlo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY equipment
    ADD CONSTRAINT idx_equipment_0 UNIQUE (company_id, equipment_uid);


--
-- Name: idx_key_1; Type: CONSTRAINT; Schema: otlo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY key
    ADD CONSTRAINT idx_key_1 UNIQUE (company_id, key_uid);


--
-- Name: idx_lock_0; Type: CONSTRAINT; Schema: otlo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY lock
    ADD CONSTRAINT idx_lock_0 UNIQUE (company_id, lock_uid);


--
-- Name: idx_pda_0; Type: CONSTRAINT; Schema: otlo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pda
    ADD CONSTRAINT idx_pda_0 UNIQUE (pda_id);


--
-- Name: idx_report_instruction_01; Type: CONSTRAINT; Schema: otlo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY report_instruction
    ADD CONSTRAINT idx_report_instruction_01 PRIMARY KEY (report_id, instruction_id);


--
-- Name: idx_role; Type: CONSTRAINT; Schema: otlo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY role
    ADD CONSTRAINT idx_role UNIQUE (company_id, name);


--
-- Name: pk_action; Type: CONSTRAINT; Schema: otlo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY action
    ADD CONSTRAINT pk_action PRIMARY KEY (id);


--
-- Name: pk_adhoc; Type: CONSTRAINT; Schema: otlo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY adhoc
    ADD CONSTRAINT pk_adhoc PRIMARY KEY (id);


--
-- Name: pk_adhoc_status; Type: CONSTRAINT; Schema: otlo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY adhoc_status
    ADD CONSTRAINT pk_adhoc_status PRIMARY KEY (id);


--
-- Name: pk_asset_type; Type: CONSTRAINT; Schema: otlo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY asset_type
    ADD CONSTRAINT pk_asset_type PRIMARY KEY (id);


--
-- Name: pk_business_unit; Type: CONSTRAINT; Schema: otlo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY business_unit
    ADD CONSTRAINT pk_business_unit PRIMARY KEY (id);


--
-- Name: pk_company; Type: CONSTRAINT; Schema: otlo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY company
    ADD CONSTRAINT pk_company PRIMARY KEY (id);


--
-- Name: pk_company_settings; Type: CONSTRAINT; Schema: otlo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY company_settings
    ADD CONSTRAINT pk_company_settings PRIMARY KEY (id);


--
-- Name: pk_department; Type: CONSTRAINT; Schema: otlo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY department
    ADD CONSTRAINT pk_department PRIMARY KEY (id);


--
-- Name: pk_employee; Type: CONSTRAINT; Schema: otlo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY employee
    ADD CONSTRAINT pk_employee PRIMARY KEY (id);


--
-- Name: pk_employee_secondary_identifier; Type: CONSTRAINT; Schema: otlo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY employee_secondary_identifier
    ADD CONSTRAINT pk_employee_secondary_identifier PRIMARY KEY (id);


--
-- Name: pk_equipment; Type: CONSTRAINT; Schema: otlo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY equipment
    ADD CONSTRAINT pk_equipment PRIMARY KEY (id);


--
-- Name: pk_equipment_active_locks; Type: CONSTRAINT; Schema: otlo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY equipment_active_locks
    ADD CONSTRAINT pk_equipment_active_locks PRIMARY KEY (id);


--
-- Name: pk_equipment_asset; Type: CONSTRAINT; Schema: otlo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY equipment_asset
    ADD CONSTRAINT pk_equipment_asset PRIMARY KEY (id);


--
-- Name: pk_equipment_secondary_identifier; Type: CONSTRAINT; Schema: otlo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY equipment_secondary_identifier
    ADD CONSTRAINT pk_equipment_secondary_identifier PRIMARY KEY (id);


--
-- Name: pk_equipment_status; Type: CONSTRAINT; Schema: otlo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY equipment_status
    ADD CONSTRAINT pk_equipment_status PRIMARY KEY (id);


--
-- Name: pk_equipment_type_id; Type: CONSTRAINT; Schema: otlo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY equipment_type
    ADD CONSTRAINT pk_equipment_type_id PRIMARY KEY (id);


--
-- Name: pk_event; Type: CONSTRAINT; Schema: otlo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY event
    ADD CONSTRAINT pk_event PRIMARY KEY (id);


--
-- Name: pk_event_mode; Type: CONSTRAINT; Schema: otlo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY event_mode
    ADD CONSTRAINT pk_event_mode PRIMARY KEY (id);


--
-- Name: pk_event_report; Type: CONSTRAINT; Schema: otlo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY event_report
    ADD CONSTRAINT pk_event_report PRIMARY KEY (id);


--
-- Name: pk_event_report_data; Type: CONSTRAINT; Schema: otlo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY event_report_data
    ADD CONSTRAINT pk_event_report_data PRIMARY KEY (id);


--
-- Name: pk_event_report_data_log; Type: CONSTRAINT; Schema: otlo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY event_report_data_log
    ADD CONSTRAINT pk_event_report_data_log PRIMARY KEY (id);


--
-- Name: pk_event_status; Type: CONSTRAINT; Schema: otlo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY event_status
    ADD CONSTRAINT pk_event_status PRIMARY KEY (id);


--
-- Name: pk_event_type; Type: CONSTRAINT; Schema: otlo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY event_type
    ADD CONSTRAINT pk_event_type PRIMARY KEY (id);


--
-- Name: pk_instruction; Type: CONSTRAINT; Schema: otlo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY instruction
    ADD CONSTRAINT pk_instruction PRIMARY KEY (id);


--
-- Name: pk_instruction_type; Type: CONSTRAINT; Schema: otlo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY instruction_type
    ADD CONSTRAINT pk_instruction_type PRIMARY KEY (id);


--
-- Name: pk_key; Type: CONSTRAINT; Schema: otlo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY key
    ADD CONSTRAINT pk_key PRIMARY KEY (id);


--
-- Name: pk_key_association; Type: CONSTRAINT; Schema: otlo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY key_association
    ADD CONSTRAINT pk_key_association PRIMARY KEY (id);


--
-- Name: pk_key_secondary_identifier; Type: CONSTRAINT; Schema: otlo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY key_secondary_identifier
    ADD CONSTRAINT pk_key_secondary_identifier PRIMARY KEY (id);


--
-- Name: pk_location; Type: CONSTRAINT; Schema: otlo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY location
    ADD CONSTRAINT pk_location PRIMARY KEY (id);


--
-- Name: pk_lock; Type: CONSTRAINT; Schema: otlo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY lock
    ADD CONSTRAINT pk_lock PRIMARY KEY (id);


--
-- Name: pk_lock_secondary_identifier; Type: CONSTRAINT; Schema: otlo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY lock_secondary_identifier
    ADD CONSTRAINT pk_lock_secondary_identifier PRIMARY KEY (id);


--
-- Name: pk_pda; Type: CONSTRAINT; Schema: otlo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pda
    ADD CONSTRAINT pk_pda PRIMARY KEY (id);


--
-- Name: pk_permission; Type: CONSTRAINT; Schema: otlo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT pk_permission PRIMARY KEY (id);


--
-- Name: pk_report; Type: CONSTRAINT; Schema: otlo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY report
    ADD CONSTRAINT pk_report PRIMARY KEY (id);


--
-- Name: pk_report_process_type; Type: CONSTRAINT; Schema: otlo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY report_process_type
    ADD CONSTRAINT pk_report_process_type PRIMARY KEY (id);


--
-- Name: pk_report_status; Type: CONSTRAINT; Schema: otlo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY report_status
    ADD CONSTRAINT pk_report_status PRIMARY KEY (id);


--
-- Name: pk_report_type; Type: CONSTRAINT; Schema: otlo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY report_type
    ADD CONSTRAINT pk_report_type PRIMARY KEY (id);


--
-- Name: pk_role; Type: CONSTRAINT; Schema: otlo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY role
    ADD CONSTRAINT pk_role PRIMARY KEY (id);


--
-- Name: pk_sequence_group; Type: CONSTRAINT; Schema: otlo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sequence_group
    ADD CONSTRAINT pk_sequence_group PRIMARY KEY (id);


--
-- Name: pk_sequence_record; Type: CONSTRAINT; Schema: otlo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sequence_record
    ADD CONSTRAINT pk_sequence_record PRIMARY KEY (id);


--
-- Name: pk_sequence_type; Type: CONSTRAINT; Schema: otlo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sequence_type
    ADD CONSTRAINT pk_sequence_type PRIMARY KEY (id);


--
-- Name: pk_simple_log; Type: CONSTRAINT; Schema: otlo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY simple_log
    ADD CONSTRAINT pk_simple_log PRIMARY KEY (id);


--
-- Name: pk_simple_log_type; Type: CONSTRAINT; Schema: otlo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY simple_log_type
    ADD CONSTRAINT pk_simple_log_type PRIMARY KEY (id);


--
-- Name: pk_unit_operation; Type: CONSTRAINT; Schema: otlo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY unit_operation
    ADD CONSTRAINT pk_unit_operation PRIMARY KEY (id);


SET search_path = public, pg_catalog;

--
-- Name: play_evolutions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY play_evolutions
    ADD CONSTRAINT play_evolutions_pkey PRIMARY KEY (id);


SET search_path = otlo, pg_catalog;

--
-- Name: idx_adhoc1; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_adhoc1 ON adhoc USING btree (equipment_id);


--
-- Name: idx_adhoc2; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_adhoc2 ON adhoc USING btree (company_id);


--
-- Name: idx_adhoc_0; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_adhoc_0 ON adhoc USING btree (adhoc_status_id);


--
-- Name: idx_adhoc_1; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_adhoc_1 ON adhoc USING btree (event_id);


--
-- Name: idx_business_unit; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_business_unit ON business_unit USING btree (company_id);


--
-- Name: idx_company_settings; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_company_settings ON company_settings USING btree (company_id);


--
-- Name: idx_department2; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_department2 ON department USING btree (company_id);


--
-- Name: idx_employee; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_employee ON employee USING btree (company_id);


--
-- Name: idx_employee_0; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_employee_0 ON employee USING btree (department_id);


--
-- Name: idx_employee_1; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_employee_1 ON employee USING btree (role_id);


--
-- Name: idx_employee_secondary_identifier1; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_employee_secondary_identifier1 ON employee_secondary_identifier USING btree (employee_id);


--
-- Name: idx_equipment2; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_equipment2 ON equipment USING btree (company_id);


--
-- Name: idx_equipment3; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_equipment3 ON equipment USING btree (unit_operation_id);


--
-- Name: idx_equipment_1; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_equipment_1 ON equipment USING btree (status_id);


--
-- Name: idx_equipment_active_locks1; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_equipment_active_locks1 ON equipment_active_locks USING btree (company_id);


--
-- Name: idx_equipment_active_locks2; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_equipment_active_locks2 ON equipment_active_locks USING btree (equipment_id);


--
-- Name: idx_equipment_active_locks3; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_equipment_active_locks3 ON equipment_active_locks USING btree (lock_id);


--
-- Name: idx_equipment_active_locks4; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_equipment_active_locks4 ON equipment_active_locks USING btree (key_id);


--
-- Name: idx_equipment_asset; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_equipment_asset ON equipment_asset USING btree (equipment_id);


--
-- Name: idx_equipment_asset_0; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_equipment_asset_0 ON equipment_asset USING btree (asset_type_id);


--
-- Name: idx_equipment_secondary_identifier1; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_equipment_secondary_identifier1 ON equipment_secondary_identifier USING btree (equipment_id);


--
-- Name: idx_event1; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_event1 ON event USING btree (company_id);


--
-- Name: idx_event2; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_event2 ON event USING btree (event_mode_id);


--
-- Name: idx_event3; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_event3 ON event USING btree (event_status_id);


--
-- Name: idx_event4; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_event4 ON event USING btree (event_type_id);


--
-- Name: idx_event_report1; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_event_report1 ON event_report USING btree (event_id);


--
-- Name: idx_event_report2; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_event_report2 ON event_report USING btree (report_id);


--
-- Name: idx_event_report_data; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_event_report_data ON event_report_data USING btree (event_report_id);


--
-- Name: idx_event_report_data_0; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_event_report_data_0 ON event_report_data USING btree (equipment_id);


--
-- Name: idx_event_report_data_log1; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_event_report_data_log1 ON event_report_data_log USING btree (event_report_data_id);


--
-- Name: idx_event_report_data_log2; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_event_report_data_log2 ON event_report_data_log USING btree (equipment_id);


--
-- Name: idx_event_report_data_log3; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_event_report_data_log3 ON event_report_data_log USING btree (employee_id);


--
-- Name: idx_event_report_data_log_0; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_event_report_data_log_0 ON event_report_data_log USING btree (company_id);


--
-- Name: idx_instruction; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_instruction ON instruction USING btree (company_id);


--
-- Name: idx_instruction_1; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_instruction_1 ON instruction USING btree (instruction_type_id);


--
-- Name: idx_key; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_key ON key USING btree (company_id);


--
-- Name: idx_key_0; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_key_0 ON key USING btree (key_assoc_type_id);


--
-- Name: idx_key_lock1; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_key_lock1 ON key_lock USING btree (key_id);


--
-- Name: idx_key_lock2; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_key_lock2 ON key_lock USING btree (lock_id);


--
-- Name: idx_key_secondary_identifier1; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_key_secondary_identifier1 ON key_secondary_identifier USING btree (key_id);


--
-- Name: idx_location1; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_location1 ON location USING btree (company_id);


--
-- Name: idx_location2; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_location2 ON location USING btree (business_unit_id);


--
-- Name: idx_lock; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_lock ON lock USING btree (company_id);


--
-- Name: idx_lock_secondary_identifier1; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_lock_secondary_identifier1 ON lock_secondary_identifier USING btree (lock_id);


--
-- Name: idx_pda; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_pda ON pda USING btree (employee_id);


--
-- Name: idx_permission; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_permission ON permission USING btree (action_id);


--
-- Name: idx_report_0; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_report_0 ON report USING btree (company_id);


--
-- Name: idx_report_1; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_report_1 ON report USING btree (report_status_id);


--
-- Name: idx_report_2; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_report_2 ON report USING btree (report_type_id);


--
-- Name: idx_report_department1; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_report_department1 ON report_department USING btree (department_id);


--
-- Name: idx_report_department2; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_report_department2 ON report_department USING btree (report_id);


--
-- Name: idx_report_role1; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_report_role1 ON report_role USING btree (role_id);


--
-- Name: idx_report_role2; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_report_role2 ON report_role USING btree (report_id);


--
-- Name: idx_role_0; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_role_0 ON role USING btree (company_id);


--
-- Name: idx_role_permission1; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_role_permission1 ON role_permission USING btree (role_id);


--
-- Name: idx_role_permission2; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_role_permission2 ON role_permission USING btree (permission_id);


--
-- Name: idx_sequence_group1; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_sequence_group1 ON sequence_group USING btree (sequence_type_id);


--
-- Name: idx_sequence_group2; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_sequence_group2 ON sequence_group USING btree (unit_operation_id);


--
-- Name: idx_sequence_group_0; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_sequence_group_0 ON sequence_group USING btree (instruction_id);


--
-- Name: idx_sequence_record; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_sequence_record ON sequence_record USING btree (sequence_group_id);


--
-- Name: idx_simple_log; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_simple_log ON simple_log USING btree (company_id);


--
-- Name: idx_simple_log_0; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_simple_log_0 ON simple_log USING btree (simple_log_type_id);


--
-- Name: idx_unit_operation1; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_unit_operation1 ON unit_operation USING btree (company_id);


--
-- Name: idx_unit_operation2; Type: INDEX; Schema: otlo; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_unit_operation2 ON unit_operation USING btree (location_id);


--
-- Name: adhoc_adhoc_type_id_fkey; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY adhoc
    ADD CONSTRAINT adhoc_adhoc_type_id_fkey FOREIGN KEY (adhoc_type_id) REFERENCES adhoc_type(id);


--
-- Name: adhoc_auxiliary_equipment_id_fkey; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY adhoc
    ADD CONSTRAINT adhoc_auxiliary_equipment_id_fkey FOREIGN KEY (auxiliary_equipment_id) REFERENCES equipment(id);


--
-- Name: adhoc_equipment_id_fk; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY adhoc
    ADD CONSTRAINT adhoc_equipment_id_fk FOREIGN KEY (auxiliary_equipment_id) REFERENCES equipment(id) ON UPDATE SET NULL ON DELETE SET NULL;


--
-- Name: auxiliary_equipment_equipment_id2_fk; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY auxiliary_equipment
    ADD CONSTRAINT auxiliary_equipment_equipment_id2_fk FOREIGN KEY (auxiliary_equipment_id) REFERENCES equipment(id);


--
-- Name: auxiliary_equipment_equipment_id_fk; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY auxiliary_equipment
    ADD CONSTRAINT auxiliary_equipment_equipment_id_fk FOREIGN KEY (equipment_id) REFERENCES equipment(id);


--
-- Name: equipment_auxiliary_id_fkey; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY equipment
    ADD CONSTRAINT equipment_auxiliary_id_fkey FOREIGN KEY (auxiliary_id) REFERENCES equipment(id);


--
-- Name: fk_adhoc_adhoc_status; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY adhoc
    ADD CONSTRAINT fk_adhoc_adhoc_status FOREIGN KEY (adhoc_status_id) REFERENCES adhoc_status(id);


--
-- Name: fk_adhoc_company; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY adhoc
    ADD CONSTRAINT fk_adhoc_company FOREIGN KEY (company_id) REFERENCES company(id) ON DELETE CASCADE;


--
-- Name: fk_adhoc_equipment; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY adhoc
    ADD CONSTRAINT fk_adhoc_equipment FOREIGN KEY (equipment_id) REFERENCES equipment(id);


--
-- Name: fk_adhoc_event; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY adhoc
    ADD CONSTRAINT fk_adhoc_event FOREIGN KEY (event_id) REFERENCES event(id);


--
-- Name: fk_business_unit_company; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY business_unit
    ADD CONSTRAINT fk_business_unit_company FOREIGN KEY (company_id) REFERENCES company(id) ON DELETE CASCADE;


--
-- Name: fk_company_settings_company; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY company_settings
    ADD CONSTRAINT fk_company_settings_company FOREIGN KEY (company_id) REFERENCES company(id);


--
-- Name: fk_department_company; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY department
    ADD CONSTRAINT fk_department_company FOREIGN KEY (company_id) REFERENCES company(id) ON DELETE CASCADE;


--
-- Name: fk_employee_company; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY employee
    ADD CONSTRAINT fk_employee_company FOREIGN KEY (company_id) REFERENCES company(id) ON DELETE CASCADE;


--
-- Name: fk_employee_department; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY employee
    ADD CONSTRAINT fk_employee_department FOREIGN KEY (department_id) REFERENCES department(id);


--
-- Name: fk_employee_role; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY employee
    ADD CONSTRAINT fk_employee_role FOREIGN KEY (role_id) REFERENCES role(id);


--
-- Name: fk_employee_secondary_identifier; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY employee_secondary_identifier
    ADD CONSTRAINT fk_employee_secondary_identifier FOREIGN KEY (employee_id) REFERENCES employee(id) ON DELETE CASCADE;


--
-- Name: fk_equipment_active_locks; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY equipment_active_locks
    ADD CONSTRAINT fk_equipment_active_locks FOREIGN KEY (company_id) REFERENCES company(id) ON DELETE CASCADE;


--
-- Name: fk_equipment_active_locks1; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY equipment_active_locks
    ADD CONSTRAINT fk_equipment_active_locks1 FOREIGN KEY (equipment_id) REFERENCES equipment(id) ON DELETE CASCADE;


--
-- Name: fk_equipment_active_locks_key; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY equipment_active_locks
    ADD CONSTRAINT fk_equipment_active_locks_key FOREIGN KEY (key_id) REFERENCES key(id);


--
-- Name: fk_equipment_active_locks_lock; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY equipment_active_locks
    ADD CONSTRAINT fk_equipment_active_locks_lock FOREIGN KEY (lock_id) REFERENCES lock(id);


--
-- Name: fk_equipment_asset_asset_type; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY equipment_asset
    ADD CONSTRAINT fk_equipment_asset_asset_type FOREIGN KEY (asset_type_id) REFERENCES asset_type(id);


--
-- Name: fk_equipment_asset_equipment; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY equipment_asset
    ADD CONSTRAINT fk_equipment_asset_equipment FOREIGN KEY (equipment_id) REFERENCES equipment(id) ON DELETE CASCADE;


--
-- Name: fk_equipment_company; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY equipment
    ADD CONSTRAINT fk_equipment_company FOREIGN KEY (company_id) REFERENCES company(id) ON DELETE CASCADE;


--
-- Name: fk_equipment_equipment_status; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY equipment
    ADD CONSTRAINT fk_equipment_equipment_status FOREIGN KEY (status_id) REFERENCES equipment_status(id);


--
-- Name: fk_equipment_equipment_type; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY equipment
    ADD CONSTRAINT fk_equipment_equipment_type FOREIGN KEY (type_id) REFERENCES equipment_type(id) ON DELETE CASCADE;


--
-- Name: fk_equipment_secondary_identifier; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY equipment_secondary_identifier
    ADD CONSTRAINT fk_equipment_secondary_identifier FOREIGN KEY (equipment_id) REFERENCES equipment(id) ON DELETE CASCADE;


--
-- Name: fk_equipment_unit_operation; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY equipment
    ADD CONSTRAINT fk_equipment_unit_operation FOREIGN KEY (unit_operation_id) REFERENCES unit_operation(id);


--
-- Name: fk_event_company; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY event
    ADD CONSTRAINT fk_event_company FOREIGN KEY (company_id) REFERENCES company(id) ON DELETE CASCADE;


--
-- Name: fk_event_employee1; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY event
    ADD CONSTRAINT fk_event_employee1 FOREIGN KEY (scheduled_by) REFERENCES employee(id) ON DELETE SET NULL;


--
-- Name: fk_event_event_mode; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY event
    ADD CONSTRAINT fk_event_event_mode FOREIGN KEY (event_mode_id) REFERENCES event_mode(id);


--
-- Name: fk_event_event_status; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY event
    ADD CONSTRAINT fk_event_event_status FOREIGN KEY (event_status_id) REFERENCES event_status(id);


--
-- Name: fk_event_event_type; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY event
    ADD CONSTRAINT fk_event_event_type FOREIGN KEY (event_type_id) REFERENCES event_type(id);


--
-- Name: fk_event_report_data; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY event_report_data
    ADD CONSTRAINT fk_event_report_data FOREIGN KEY (event_report_id) REFERENCES event_report(id) ON DELETE CASCADE;


--
-- Name: fk_event_report_data_equipment; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY event_report_data
    ADD CONSTRAINT fk_event_report_data_equipment FOREIGN KEY (equipment_id) REFERENCES equipment(id);


--
-- Name: fk_event_report_data_log; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY event_report_data_log
    ADD CONSTRAINT fk_event_report_data_log FOREIGN KEY (event_report_data_id) REFERENCES event_report_data(id);


--
-- Name: fk_event_report_data_log1; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY event_report_data_log
    ADD CONSTRAINT fk_event_report_data_log1 FOREIGN KEY (employee_id) REFERENCES employee(id);


--
-- Name: fk_event_report_data_log3; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY event_report_data_log
    ADD CONSTRAINT fk_event_report_data_log3 FOREIGN KEY (equipment_id) REFERENCES equipment(id);


--
-- Name: fk_event_report_data_log4; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY event_report_data_log
    ADD CONSTRAINT fk_event_report_data_log4 FOREIGN KEY (company_id) REFERENCES company(id) ON DELETE CASCADE;


--
-- Name: fk_event_report_data_log_key; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY event_report_data_log
    ADD CONSTRAINT fk_event_report_data_log_key FOREIGN KEY (key) REFERENCES key(id) ON DELETE SET NULL;


--
-- Name: fk_event_report_data_log_lock; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY event_report_data_log
    ADD CONSTRAINT fk_event_report_data_log_lock FOREIGN KEY (lock) REFERENCES lock(id) ON DELETE SET NULL;


--
-- Name: fk_event_report_event; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY event_report
    ADD CONSTRAINT fk_event_report_event FOREIGN KEY (event_id) REFERENCES event(id) ON DELETE CASCADE;


--
-- Name: fk_event_report_report; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY event_report
    ADD CONSTRAINT fk_event_report_report FOREIGN KEY (report_id) REFERENCES report(id) ON DELETE CASCADE;


--
-- Name: fk_instruction; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY instruction
    ADD CONSTRAINT fk_instruction FOREIGN KEY (instruction_type_id) REFERENCES instruction_type(id);


--
-- Name: fk_instruction_company; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY instruction
    ADD CONSTRAINT fk_instruction_company FOREIGN KEY (company_id) REFERENCES company(id) ON DELETE CASCADE;


--
-- Name: fk_key_company; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY key
    ADD CONSTRAINT fk_key_company FOREIGN KEY (company_id) REFERENCES company(id) ON DELETE CASCADE;


--
-- Name: fk_key_key_association; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY key
    ADD CONSTRAINT fk_key_key_association FOREIGN KEY (key_assoc_type_id) REFERENCES key_association(id);


--
-- Name: fk_key_lock_key; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY key_lock
    ADD CONSTRAINT fk_key_lock_key FOREIGN KEY (key_id) REFERENCES key(id) ON DELETE CASCADE;


--
-- Name: fk_key_lock_lock; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY key_lock
    ADD CONSTRAINT fk_key_lock_lock FOREIGN KEY (lock_id) REFERENCES lock(id) ON DELETE CASCADE;


--
-- Name: fk_key_secondary_identifier; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY key_secondary_identifier
    ADD CONSTRAINT fk_key_secondary_identifier FOREIGN KEY (key_id) REFERENCES key(id) ON DELETE CASCADE;


--
-- Name: fk_location_business_unit; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY location
    ADD CONSTRAINT fk_location_business_unit FOREIGN KEY (business_unit_id) REFERENCES business_unit(id);


--
-- Name: fk_location_company; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY location
    ADD CONSTRAINT fk_location_company FOREIGN KEY (company_id) REFERENCES company(id) ON DELETE CASCADE;


--
-- Name: fk_lock_company; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY lock
    ADD CONSTRAINT fk_lock_company FOREIGN KEY (company_id) REFERENCES company(id) ON DELETE CASCADE;


--
-- Name: fk_lock_secondary_identifier; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY lock_secondary_identifier
    ADD CONSTRAINT fk_lock_secondary_identifier FOREIGN KEY (lock_id) REFERENCES lock(id) ON DELETE CASCADE;


--
-- Name: fk_pda_employee; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY pda
    ADD CONSTRAINT fk_pda_employee FOREIGN KEY (employee_id) REFERENCES employee(id) ON DELETE CASCADE;


--
-- Name: fk_permission_action; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT fk_permission_action FOREIGN KEY (action_id) REFERENCES action(id) ON DELETE CASCADE;


--
-- Name: fk_report_company; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_report_company FOREIGN KEY (company_id) REFERENCES company(id) ON DELETE CASCADE;


--
-- Name: fk_report_department; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY report_department
    ADD CONSTRAINT fk_report_department FOREIGN KEY (department_id) REFERENCES department(id) ON DELETE CASCADE;


--
-- Name: fk_report_department_report; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY report_department
    ADD CONSTRAINT fk_report_department_report FOREIGN KEY (report_id) REFERENCES report(id) ON DELETE CASCADE;


--
-- Name: fk_report_instruction1; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY report_instruction
    ADD CONSTRAINT fk_report_instruction1 FOREIGN KEY (instruction_id) REFERENCES instruction(id) ON DELETE CASCADE;


--
-- Name: fk_report_instruction_report; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY report_instruction
    ADD CONSTRAINT fk_report_instruction_report FOREIGN KEY (report_id) REFERENCES report(id) ON DELETE CASCADE;


--
-- Name: fk_report_report_process_type; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_report_report_process_type FOREIGN KEY (process_type_id) REFERENCES report_process_type(id) ON DELETE SET NULL;


--
-- Name: fk_report_report_status; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_report_report_status FOREIGN KEY (report_status_id) REFERENCES report_status(id);


--
-- Name: fk_report_report_type; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_report_report_type FOREIGN KEY (report_type_id) REFERENCES report_type(id);


--
-- Name: fk_report_role_report; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY report_role
    ADD CONSTRAINT fk_report_role_report FOREIGN KEY (report_id) REFERENCES report(id) ON DELETE CASCADE;


--
-- Name: fk_report_role_role; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY report_role
    ADD CONSTRAINT fk_report_role_role FOREIGN KEY (role_id) REFERENCES role(id) ON DELETE CASCADE;


--
-- Name: fk_role_company; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY role
    ADD CONSTRAINT fk_role_company FOREIGN KEY (company_id) REFERENCES company(id) ON DELETE CASCADE;


--
-- Name: fk_role_permission_permission; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY role_permission
    ADD CONSTRAINT fk_role_permission_permission FOREIGN KEY (permission_id) REFERENCES permission(id) ON DELETE CASCADE;


--
-- Name: fk_role_permission_role; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY role_permission
    ADD CONSTRAINT fk_role_permission_role FOREIGN KEY (role_id) REFERENCES role(id) ON DELETE CASCADE;


--
-- Name: fk_sequence_group; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY sequence_group
    ADD CONSTRAINT fk_sequence_group FOREIGN KEY (sequence_type_id) REFERENCES sequence_type(id) ON DELETE CASCADE;


--
-- Name: fk_sequence_group1; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY sequence_group
    ADD CONSTRAINT fk_sequence_group1 FOREIGN KEY (unit_operation_id) REFERENCES unit_operation(id) ON DELETE CASCADE;


--
-- Name: fk_sequence_group_instruction; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY sequence_group
    ADD CONSTRAINT fk_sequence_group_instruction FOREIGN KEY (instruction_id) REFERENCES instruction(id) ON DELETE CASCADE;


--
-- Name: fk_sequence_record; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY sequence_record
    ADD CONSTRAINT fk_sequence_record FOREIGN KEY (sequence_group_id) REFERENCES sequence_group(id) ON DELETE CASCADE;


--
-- Name: fk_sequence_record_equipment; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY sequence_record
    ADD CONSTRAINT fk_sequence_record_equipment FOREIGN KEY (equipment_id) REFERENCES equipment(id) ON DELETE SET NULL;


--
-- Name: fk_simple_log_company; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY simple_log
    ADD CONSTRAINT fk_simple_log_company FOREIGN KEY (company_id) REFERENCES company(id) ON DELETE CASCADE;


--
-- Name: fk_simple_log_simple_log_type; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY simple_log
    ADD CONSTRAINT fk_simple_log_simple_log_type FOREIGN KEY (simple_log_type_id) REFERENCES simple_log_type(id);


--
-- Name: fk_unit_operation_company; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY unit_operation
    ADD CONSTRAINT fk_unit_operation_company FOREIGN KEY (company_id) REFERENCES company(id) ON DELETE CASCADE;


--
-- Name: fk_unit_operation_location; Type: FK CONSTRAINT; Schema: otlo; Owner: postgres
--

ALTER TABLE ONLY unit_operation
    ADD CONSTRAINT fk_unit_operation_location FOREIGN KEY (location_id) REFERENCES location(id);


--
-- Name: otlo; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA otlo FROM PUBLIC;
REVOKE ALL ON SCHEMA otlo FROM postgres;
GRANT ALL ON SCHEMA otlo TO postgres;
GRANT USAGE ON SCHEMA otlo TO test;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT USAGE ON SCHEMA public TO test;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: action; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON TABLE action FROM PUBLIC;
REVOKE ALL ON TABLE action FROM postgres;
GRANT ALL ON TABLE action TO postgres;
GRANT SELECT,INSERT ON TABLE action TO test;


--
-- Name: action_id_seq; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON SEQUENCE action_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE action_id_seq FROM postgres;
GRANT ALL ON SEQUENCE action_id_seq TO postgres;
GRANT SELECT ON SEQUENCE action_id_seq TO test;


--
-- Name: adhoc; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON TABLE adhoc FROM PUBLIC;
REVOKE ALL ON TABLE adhoc FROM postgres;
GRANT ALL ON TABLE adhoc TO postgres;
GRANT SELECT,INSERT ON TABLE adhoc TO test;


--
-- Name: adhoc_id_seq; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON SEQUENCE adhoc_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE adhoc_id_seq FROM postgres;
GRANT ALL ON SEQUENCE adhoc_id_seq TO postgres;
GRANT SELECT ON SEQUENCE adhoc_id_seq TO test;


--
-- Name: adhoc_status; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON TABLE adhoc_status FROM PUBLIC;
REVOKE ALL ON TABLE adhoc_status FROM postgres;
GRANT ALL ON TABLE adhoc_status TO postgres;
GRANT SELECT,INSERT ON TABLE adhoc_status TO test;


--
-- Name: adhoc_status_id_seq; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON SEQUENCE adhoc_status_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE adhoc_status_id_seq FROM postgres;
GRANT ALL ON SEQUENCE adhoc_status_id_seq TO postgres;
GRANT SELECT ON SEQUENCE adhoc_status_id_seq TO test;


--
-- Name: adhoc_type; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON TABLE adhoc_type FROM PUBLIC;
REVOKE ALL ON TABLE adhoc_type FROM postgres;
GRANT ALL ON TABLE adhoc_type TO postgres;
GRANT SELECT,INSERT ON TABLE adhoc_type TO test;


--
-- Name: adhoc_type_id_seq; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON SEQUENCE adhoc_type_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE adhoc_type_id_seq FROM postgres;
GRANT ALL ON SEQUENCE adhoc_type_id_seq TO postgres;
GRANT SELECT ON SEQUENCE adhoc_type_id_seq TO test;


--
-- Name: asset_type; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON TABLE asset_type FROM PUBLIC;
REVOKE ALL ON TABLE asset_type FROM postgres;
GRANT ALL ON TABLE asset_type TO postgres;
GRANT SELECT,INSERT ON TABLE asset_type TO test;


--
-- Name: asset_type_id_seq; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON SEQUENCE asset_type_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE asset_type_id_seq FROM postgres;
GRANT ALL ON SEQUENCE asset_type_id_seq TO postgres;
GRANT SELECT ON SEQUENCE asset_type_id_seq TO test;


--
-- Name: auxiliary_equipment; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON TABLE auxiliary_equipment FROM PUBLIC;
REVOKE ALL ON TABLE auxiliary_equipment FROM postgres;
GRANT ALL ON TABLE auxiliary_equipment TO postgres;
GRANT SELECT,INSERT ON TABLE auxiliary_equipment TO test;


--
-- Name: business_unit; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON TABLE business_unit FROM PUBLIC;
REVOKE ALL ON TABLE business_unit FROM postgres;
GRANT ALL ON TABLE business_unit TO postgres;
GRANT SELECT,INSERT ON TABLE business_unit TO test;


--
-- Name: business_unit_id_seq; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON SEQUENCE business_unit_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE business_unit_id_seq FROM postgres;
GRANT ALL ON SEQUENCE business_unit_id_seq TO postgres;
GRANT SELECT ON SEQUENCE business_unit_id_seq TO test;


--
-- Name: company; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON TABLE company FROM PUBLIC;
REVOKE ALL ON TABLE company FROM postgres;
GRANT ALL ON TABLE company TO postgres;
GRANT SELECT,INSERT ON TABLE company TO test;


--
-- Name: company_id_seq; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON SEQUENCE company_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE company_id_seq FROM postgres;
GRANT ALL ON SEQUENCE company_id_seq TO postgres;
GRANT SELECT ON SEQUENCE company_id_seq TO test;


--
-- Name: company_settings; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON TABLE company_settings FROM PUBLIC;
REVOKE ALL ON TABLE company_settings FROM postgres;
GRANT ALL ON TABLE company_settings TO postgres;
GRANT SELECT,INSERT ON TABLE company_settings TO test;


--
-- Name: company_settings_id_seq; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON SEQUENCE company_settings_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE company_settings_id_seq FROM postgres;
GRANT ALL ON SEQUENCE company_settings_id_seq TO postgres;
GRANT SELECT ON SEQUENCE company_settings_id_seq TO test;


--
-- Name: department; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON TABLE department FROM PUBLIC;
REVOKE ALL ON TABLE department FROM postgres;
GRANT ALL ON TABLE department TO postgres;
GRANT SELECT,INSERT ON TABLE department TO test;


--
-- Name: department_id_seq; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON SEQUENCE department_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE department_id_seq FROM postgres;
GRANT ALL ON SEQUENCE department_id_seq TO postgres;
GRANT SELECT ON SEQUENCE department_id_seq TO test;


--
-- Name: employee; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON TABLE employee FROM PUBLIC;
REVOKE ALL ON TABLE employee FROM postgres;
GRANT ALL ON TABLE employee TO postgres;
GRANT SELECT,INSERT ON TABLE employee TO test;


--
-- Name: employee_id_seq; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON SEQUENCE employee_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE employee_id_seq FROM postgres;
GRANT ALL ON SEQUENCE employee_id_seq TO postgres;
GRANT SELECT ON SEQUENCE employee_id_seq TO test;


--
-- Name: employee_secondary_identifier; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON TABLE employee_secondary_identifier FROM PUBLIC;
REVOKE ALL ON TABLE employee_secondary_identifier FROM postgres;
GRANT ALL ON TABLE employee_secondary_identifier TO postgres;
GRANT SELECT,INSERT ON TABLE employee_secondary_identifier TO test;


--
-- Name: employee_secondary_identifier_id_seq; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON SEQUENCE employee_secondary_identifier_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE employee_secondary_identifier_id_seq FROM postgres;
GRANT ALL ON SEQUENCE employee_secondary_identifier_id_seq TO postgres;
GRANT SELECT ON SEQUENCE employee_secondary_identifier_id_seq TO test;


--
-- Name: equipment; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON TABLE equipment FROM PUBLIC;
REVOKE ALL ON TABLE equipment FROM postgres;
GRANT ALL ON TABLE equipment TO postgres;
GRANT SELECT,INSERT ON TABLE equipment TO test;


--
-- Name: equipment_active_locks; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON TABLE equipment_active_locks FROM PUBLIC;
REVOKE ALL ON TABLE equipment_active_locks FROM postgres;
GRANT ALL ON TABLE equipment_active_locks TO postgres;
GRANT SELECT,INSERT ON TABLE equipment_active_locks TO test;


--
-- Name: equipment_active_locks_id_seq; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON SEQUENCE equipment_active_locks_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE equipment_active_locks_id_seq FROM postgres;
GRANT ALL ON SEQUENCE equipment_active_locks_id_seq TO postgres;
GRANT SELECT ON SEQUENCE equipment_active_locks_id_seq TO test;


--
-- Name: equipment_asset; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON TABLE equipment_asset FROM PUBLIC;
REVOKE ALL ON TABLE equipment_asset FROM postgres;
GRANT ALL ON TABLE equipment_asset TO postgres;
GRANT SELECT,INSERT ON TABLE equipment_asset TO test;


--
-- Name: equipment_asset_id_seq; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON SEQUENCE equipment_asset_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE equipment_asset_id_seq FROM postgres;
GRANT ALL ON SEQUENCE equipment_asset_id_seq TO postgres;
GRANT SELECT ON SEQUENCE equipment_asset_id_seq TO test;


--
-- Name: equipment_id_seq; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON SEQUENCE equipment_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE equipment_id_seq FROM postgres;
GRANT ALL ON SEQUENCE equipment_id_seq TO postgres;
GRANT SELECT ON SEQUENCE equipment_id_seq TO test;


--
-- Name: equipment_secondary_identifier; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON TABLE equipment_secondary_identifier FROM PUBLIC;
REVOKE ALL ON TABLE equipment_secondary_identifier FROM postgres;
GRANT ALL ON TABLE equipment_secondary_identifier TO postgres;
GRANT SELECT,INSERT ON TABLE equipment_secondary_identifier TO test;


--
-- Name: equipment_secondary_identifier_id_seq; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON SEQUENCE equipment_secondary_identifier_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE equipment_secondary_identifier_id_seq FROM postgres;
GRANT ALL ON SEQUENCE equipment_secondary_identifier_id_seq TO postgres;
GRANT SELECT ON SEQUENCE equipment_secondary_identifier_id_seq TO test;


--
-- Name: equipment_status; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON TABLE equipment_status FROM PUBLIC;
REVOKE ALL ON TABLE equipment_status FROM postgres;
GRANT ALL ON TABLE equipment_status TO postgres;
GRANT SELECT,INSERT ON TABLE equipment_status TO test;


--
-- Name: equipment_status_id_seq; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON SEQUENCE equipment_status_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE equipment_status_id_seq FROM postgres;
GRANT ALL ON SEQUENCE equipment_status_id_seq TO postgres;
GRANT SELECT ON SEQUENCE equipment_status_id_seq TO test;


--
-- Name: equipment_type; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON TABLE equipment_type FROM PUBLIC;
REVOKE ALL ON TABLE equipment_type FROM postgres;
GRANT ALL ON TABLE equipment_type TO postgres;
GRANT SELECT,INSERT ON TABLE equipment_type TO test;


--
-- Name: event; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON TABLE event FROM PUBLIC;
REVOKE ALL ON TABLE event FROM postgres;
GRANT ALL ON TABLE event TO postgres;
GRANT SELECT,INSERT ON TABLE event TO test;


--
-- Name: event_id_seq; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON SEQUENCE event_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE event_id_seq FROM postgres;
GRANT ALL ON SEQUENCE event_id_seq TO postgres;
GRANT SELECT ON SEQUENCE event_id_seq TO test;


--
-- Name: event_mode; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON TABLE event_mode FROM PUBLIC;
REVOKE ALL ON TABLE event_mode FROM postgres;
GRANT ALL ON TABLE event_mode TO postgres;
GRANT SELECT,INSERT ON TABLE event_mode TO test;


--
-- Name: event_mode_id_seq; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON SEQUENCE event_mode_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE event_mode_id_seq FROM postgres;
GRANT ALL ON SEQUENCE event_mode_id_seq TO postgres;
GRANT SELECT ON SEQUENCE event_mode_id_seq TO test;


--
-- Name: event_report; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON TABLE event_report FROM PUBLIC;
REVOKE ALL ON TABLE event_report FROM postgres;
GRANT ALL ON TABLE event_report TO postgres;
GRANT SELECT,INSERT ON TABLE event_report TO test;


--
-- Name: event_report_data; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON TABLE event_report_data FROM PUBLIC;
REVOKE ALL ON TABLE event_report_data FROM postgres;
GRANT ALL ON TABLE event_report_data TO postgres;
GRANT SELECT,INSERT ON TABLE event_report_data TO test;


--
-- Name: event_report_data_id_seq; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON SEQUENCE event_report_data_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE event_report_data_id_seq FROM postgres;
GRANT ALL ON SEQUENCE event_report_data_id_seq TO postgres;
GRANT SELECT ON SEQUENCE event_report_data_id_seq TO test;


--
-- Name: event_report_data_log; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON TABLE event_report_data_log FROM PUBLIC;
REVOKE ALL ON TABLE event_report_data_log FROM postgres;
GRANT ALL ON TABLE event_report_data_log TO postgres;
GRANT SELECT,INSERT ON TABLE event_report_data_log TO test;


--
-- Name: event_report_data_log_id_seq; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON SEQUENCE event_report_data_log_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE event_report_data_log_id_seq FROM postgres;
GRANT ALL ON SEQUENCE event_report_data_log_id_seq TO postgres;
GRANT SELECT ON SEQUENCE event_report_data_log_id_seq TO test;


--
-- Name: event_report_id_seq; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON SEQUENCE event_report_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE event_report_id_seq FROM postgres;
GRANT ALL ON SEQUENCE event_report_id_seq TO postgres;
GRANT SELECT ON SEQUENCE event_report_id_seq TO test;


--
-- Name: event_status; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON TABLE event_status FROM PUBLIC;
REVOKE ALL ON TABLE event_status FROM postgres;
GRANT ALL ON TABLE event_status TO postgres;
GRANT SELECT,INSERT ON TABLE event_status TO test;


--
-- Name: event_status_id_seq; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON SEQUENCE event_status_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE event_status_id_seq FROM postgres;
GRANT ALL ON SEQUENCE event_status_id_seq TO postgres;
GRANT SELECT ON SEQUENCE event_status_id_seq TO test;


--
-- Name: event_type; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON TABLE event_type FROM PUBLIC;
REVOKE ALL ON TABLE event_type FROM postgres;
GRANT ALL ON TABLE event_type TO postgres;
GRANT SELECT,INSERT ON TABLE event_type TO test;


--
-- Name: event_type_id_seq; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON SEQUENCE event_type_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE event_type_id_seq FROM postgres;
GRANT ALL ON SEQUENCE event_type_id_seq TO postgres;
GRANT SELECT ON SEQUENCE event_type_id_seq TO test;


--
-- Name: instruction; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON TABLE instruction FROM PUBLIC;
REVOKE ALL ON TABLE instruction FROM postgres;
GRANT ALL ON TABLE instruction TO postgres;
GRANT SELECT,INSERT ON TABLE instruction TO test;


--
-- Name: instruction_id_seq; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON SEQUENCE instruction_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE instruction_id_seq FROM postgres;
GRANT ALL ON SEQUENCE instruction_id_seq TO postgres;
GRANT SELECT ON SEQUENCE instruction_id_seq TO test;


--
-- Name: instruction_type; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON TABLE instruction_type FROM PUBLIC;
REVOKE ALL ON TABLE instruction_type FROM postgres;
GRANT ALL ON TABLE instruction_type TO postgres;
GRANT SELECT,INSERT ON TABLE instruction_type TO test;


--
-- Name: instruction_type_id_seq; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON SEQUENCE instruction_type_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE instruction_type_id_seq FROM postgres;
GRANT ALL ON SEQUENCE instruction_type_id_seq TO postgres;
GRANT SELECT ON SEQUENCE instruction_type_id_seq TO test;


--
-- Name: key; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON TABLE key FROM PUBLIC;
REVOKE ALL ON TABLE key FROM postgres;
GRANT ALL ON TABLE key TO postgres;
GRANT SELECT,INSERT ON TABLE key TO test;


--
-- Name: key_association; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON TABLE key_association FROM PUBLIC;
REVOKE ALL ON TABLE key_association FROM postgres;
GRANT ALL ON TABLE key_association TO postgres;
GRANT SELECT,INSERT ON TABLE key_association TO test;


--
-- Name: key_association_id_seq; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON SEQUENCE key_association_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE key_association_id_seq FROM postgres;
GRANT ALL ON SEQUENCE key_association_id_seq TO postgres;
GRANT SELECT ON SEQUENCE key_association_id_seq TO test;


--
-- Name: key_id_seq; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON SEQUENCE key_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE key_id_seq FROM postgres;
GRANT ALL ON SEQUENCE key_id_seq TO postgres;
GRANT SELECT ON SEQUENCE key_id_seq TO test;


--
-- Name: key_lock; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON TABLE key_lock FROM PUBLIC;
REVOKE ALL ON TABLE key_lock FROM postgres;
GRANT ALL ON TABLE key_lock TO postgres;
GRANT SELECT,INSERT ON TABLE key_lock TO test;


--
-- Name: key_secondary_identifier; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON TABLE key_secondary_identifier FROM PUBLIC;
REVOKE ALL ON TABLE key_secondary_identifier FROM postgres;
GRANT ALL ON TABLE key_secondary_identifier TO postgres;
GRANT SELECT,INSERT ON TABLE key_secondary_identifier TO test;


--
-- Name: key_secondary_identifier_id_seq; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON SEQUENCE key_secondary_identifier_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE key_secondary_identifier_id_seq FROM postgres;
GRANT ALL ON SEQUENCE key_secondary_identifier_id_seq TO postgres;
GRANT SELECT ON SEQUENCE key_secondary_identifier_id_seq TO test;


--
-- Name: location; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON TABLE location FROM PUBLIC;
REVOKE ALL ON TABLE location FROM postgres;
GRANT ALL ON TABLE location TO postgres;
GRANT SELECT,INSERT ON TABLE location TO test;


--
-- Name: location_id_seq; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON SEQUENCE location_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE location_id_seq FROM postgres;
GRANT ALL ON SEQUENCE location_id_seq TO postgres;
GRANT SELECT ON SEQUENCE location_id_seq TO test;


--
-- Name: lock; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON TABLE lock FROM PUBLIC;
REVOKE ALL ON TABLE lock FROM postgres;
GRANT ALL ON TABLE lock TO postgres;
GRANT SELECT,INSERT ON TABLE lock TO test;


--
-- Name: lock_id_seq; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON SEQUENCE lock_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE lock_id_seq FROM postgres;
GRANT ALL ON SEQUENCE lock_id_seq TO postgres;
GRANT SELECT ON SEQUENCE lock_id_seq TO test;


--
-- Name: lock_secondary_identifier; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON TABLE lock_secondary_identifier FROM PUBLIC;
REVOKE ALL ON TABLE lock_secondary_identifier FROM postgres;
GRANT ALL ON TABLE lock_secondary_identifier TO postgres;
GRANT SELECT,INSERT ON TABLE lock_secondary_identifier TO test;


--
-- Name: lock_secondary_identifier_id_seq; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON SEQUENCE lock_secondary_identifier_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE lock_secondary_identifier_id_seq FROM postgres;
GRANT ALL ON SEQUENCE lock_secondary_identifier_id_seq TO postgres;
GRANT SELECT ON SEQUENCE lock_secondary_identifier_id_seq TO test;


--
-- Name: pda; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON TABLE pda FROM PUBLIC;
REVOKE ALL ON TABLE pda FROM postgres;
GRANT ALL ON TABLE pda TO postgres;
GRANT SELECT,INSERT ON TABLE pda TO test;


--
-- Name: pda_id_seq; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON SEQUENCE pda_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE pda_id_seq FROM postgres;
GRANT ALL ON SEQUENCE pda_id_seq TO postgres;
GRANT SELECT ON SEQUENCE pda_id_seq TO test;


--
-- Name: permission; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON TABLE permission FROM PUBLIC;
REVOKE ALL ON TABLE permission FROM postgres;
GRANT ALL ON TABLE permission TO postgres;
GRANT SELECT,INSERT ON TABLE permission TO test;


--
-- Name: permission_id_seq; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON SEQUENCE permission_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE permission_id_seq FROM postgres;
GRANT ALL ON SEQUENCE permission_id_seq TO postgres;
GRANT SELECT ON SEQUENCE permission_id_seq TO test;


--
-- Name: report; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON TABLE report FROM PUBLIC;
REVOKE ALL ON TABLE report FROM postgres;
GRANT ALL ON TABLE report TO postgres;
GRANT SELECT,INSERT ON TABLE report TO test;


--
-- Name: report_department; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON TABLE report_department FROM PUBLIC;
REVOKE ALL ON TABLE report_department FROM postgres;
GRANT ALL ON TABLE report_department TO postgres;
GRANT SELECT,INSERT ON TABLE report_department TO test;


--
-- Name: report_id_seq; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON SEQUENCE report_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE report_id_seq FROM postgres;
GRANT ALL ON SEQUENCE report_id_seq TO postgres;
GRANT SELECT ON SEQUENCE report_id_seq TO test;


--
-- Name: report_instruction; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON TABLE report_instruction FROM PUBLIC;
REVOKE ALL ON TABLE report_instruction FROM postgres;
GRANT ALL ON TABLE report_instruction TO postgres;
GRANT SELECT,INSERT ON TABLE report_instruction TO test;


--
-- Name: report_process_type; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON TABLE report_process_type FROM PUBLIC;
REVOKE ALL ON TABLE report_process_type FROM postgres;
GRANT ALL ON TABLE report_process_type TO postgres;
GRANT SELECT,INSERT ON TABLE report_process_type TO test;


--
-- Name: report_role; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON TABLE report_role FROM PUBLIC;
REVOKE ALL ON TABLE report_role FROM postgres;
GRANT ALL ON TABLE report_role TO postgres;
GRANT SELECT,INSERT ON TABLE report_role TO test;


--
-- Name: report_status; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON TABLE report_status FROM PUBLIC;
REVOKE ALL ON TABLE report_status FROM postgres;
GRANT ALL ON TABLE report_status TO postgres;
GRANT SELECT,INSERT ON TABLE report_status TO test;


--
-- Name: report_status_id_seq; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON SEQUENCE report_status_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE report_status_id_seq FROM postgres;
GRANT ALL ON SEQUENCE report_status_id_seq TO postgres;
GRANT SELECT ON SEQUENCE report_status_id_seq TO test;


--
-- Name: report_type; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON TABLE report_type FROM PUBLIC;
REVOKE ALL ON TABLE report_type FROM postgres;
GRANT ALL ON TABLE report_type TO postgres;
GRANT SELECT,INSERT ON TABLE report_type TO test;


--
-- Name: report_type_id_seq; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON SEQUENCE report_type_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE report_type_id_seq FROM postgres;
GRANT ALL ON SEQUENCE report_type_id_seq TO postgres;
GRANT SELECT ON SEQUENCE report_type_id_seq TO test;


--
-- Name: role; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON TABLE role FROM PUBLIC;
REVOKE ALL ON TABLE role FROM postgres;
GRANT ALL ON TABLE role TO postgres;
GRANT SELECT,INSERT ON TABLE role TO test;


--
-- Name: role_id_seq; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON SEQUENCE role_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE role_id_seq FROM postgres;
GRANT ALL ON SEQUENCE role_id_seq TO postgres;
GRANT SELECT ON SEQUENCE role_id_seq TO test;


--
-- Name: role_permission; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON TABLE role_permission FROM PUBLIC;
REVOKE ALL ON TABLE role_permission FROM postgres;
GRANT ALL ON TABLE role_permission TO postgres;
GRANT SELECT,INSERT ON TABLE role_permission TO test;


--
-- Name: sequence_group; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON TABLE sequence_group FROM PUBLIC;
REVOKE ALL ON TABLE sequence_group FROM postgres;
GRANT ALL ON TABLE sequence_group TO postgres;
GRANT SELECT,INSERT ON TABLE sequence_group TO test;


--
-- Name: sequence_group_id_seq; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON SEQUENCE sequence_group_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE sequence_group_id_seq FROM postgres;
GRANT ALL ON SEQUENCE sequence_group_id_seq TO postgres;
GRANT SELECT ON SEQUENCE sequence_group_id_seq TO test;


--
-- Name: sequence_record; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON TABLE sequence_record FROM PUBLIC;
REVOKE ALL ON TABLE sequence_record FROM postgres;
GRANT ALL ON TABLE sequence_record TO postgres;
GRANT SELECT,INSERT ON TABLE sequence_record TO test;


--
-- Name: sequence_record_id_seq; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON SEQUENCE sequence_record_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE sequence_record_id_seq FROM postgres;
GRANT ALL ON SEQUENCE sequence_record_id_seq TO postgres;
GRANT SELECT ON SEQUENCE sequence_record_id_seq TO test;


--
-- Name: sequence_type; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON TABLE sequence_type FROM PUBLIC;
REVOKE ALL ON TABLE sequence_type FROM postgres;
GRANT ALL ON TABLE sequence_type TO postgres;
GRANT SELECT,INSERT ON TABLE sequence_type TO test;


--
-- Name: sequence_type_id_seq; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON SEQUENCE sequence_type_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE sequence_type_id_seq FROM postgres;
GRANT ALL ON SEQUENCE sequence_type_id_seq TO postgres;
GRANT SELECT ON SEQUENCE sequence_type_id_seq TO test;


--
-- Name: simple_log; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON TABLE simple_log FROM PUBLIC;
REVOKE ALL ON TABLE simple_log FROM postgres;
GRANT ALL ON TABLE simple_log TO postgres;
GRANT SELECT,INSERT ON TABLE simple_log TO test;


--
-- Name: simple_log_id_seq; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON SEQUENCE simple_log_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE simple_log_id_seq FROM postgres;
GRANT ALL ON SEQUENCE simple_log_id_seq TO postgres;
GRANT SELECT ON SEQUENCE simple_log_id_seq TO test;


--
-- Name: simple_log_type; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON TABLE simple_log_type FROM PUBLIC;
REVOKE ALL ON TABLE simple_log_type FROM postgres;
GRANT ALL ON TABLE simple_log_type TO postgres;
GRANT SELECT,INSERT ON TABLE simple_log_type TO test;


--
-- Name: simple_log_type_id_seq; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON SEQUENCE simple_log_type_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE simple_log_type_id_seq FROM postgres;
GRANT ALL ON SEQUENCE simple_log_type_id_seq TO postgres;
GRANT SELECT ON SEQUENCE simple_log_type_id_seq TO test;


--
-- Name: unit_operation; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON TABLE unit_operation FROM PUBLIC;
REVOKE ALL ON TABLE unit_operation FROM postgres;
GRANT ALL ON TABLE unit_operation TO postgres;
GRANT SELECT,INSERT ON TABLE unit_operation TO test;


--
-- Name: unit_operation_id_seq; Type: ACL; Schema: otlo; Owner: postgres
--

REVOKE ALL ON SEQUENCE unit_operation_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE unit_operation_id_seq FROM postgres;
GRANT ALL ON SEQUENCE unit_operation_id_seq TO postgres;
GRANT SELECT ON SEQUENCE unit_operation_id_seq TO test;


SET search_path = public, pg_catalog;

--
-- Name: play_evolutions; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE play_evolutions FROM PUBLIC;
REVOKE ALL ON TABLE play_evolutions FROM postgres;
GRANT ALL ON TABLE play_evolutions TO postgres;
GRANT SELECT ON TABLE play_evolutions TO test;


SET search_path = otlo, pg_catalog;

--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: otlo; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA otlo REVOKE ALL ON TABLES  FROM PUBLIC;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA otlo REVOKE ALL ON TABLES  FROM postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA otlo GRANT SELECT ON TABLES  TO test;


SET search_path = public, pg_catalog;

--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public REVOKE ALL ON TABLES  FROM PUBLIC;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public REVOKE ALL ON TABLES  FROM postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT SELECT ON TABLES  TO test;


--
-- PostgreSQL database dump complete
--

