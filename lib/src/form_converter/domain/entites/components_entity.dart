// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'columns_entity.dart';
import 'conditional_entity.dart';
import 'data_entity.dart';
import 'date_picker_entity.dart';
import 'fields_entity.dart';
import 'file_types_entity.dart';
import 'fuse_options_entity.dart';
import 'indexeddb_entity.dart';
import 'kickbox_entity.dart';
import 'overlay_entity.dart';
import 'properties_entity.dart';
import 'time_picker_entity.dart';
import 'validate_entity.dart';
import 'values_entity.dart';
import 'widget_entity.dart';

class ComponentEntity {
  String label;
  String labelPosition;
  String labelWidth;
  String labelMargin;
  String placeholder;
  String description;
  String tooltip;
  String prefix;
  String suffix;
  WidgetEntity widget;
  String inputMask;
  String displayMask;
  bool allowMultipleMasks;
  String customClass;
  int tabindex;
  String autocomplete;
  bool hidden;
  bool hideLabel;
  bool showWordCount;
  bool showCharCount;
  bool mask;
  bool autofocus;
  bool spellcheck;
  bool disabled;
  bool tableView;
  bool modalEdit;
  bool multiple;
  bool persistent;
  String inputFormat;
  bool protected;
  bool dbIndex;
  String casE;
  bool truncateMultipleSpaces;
  bool encrypted;
  String redrawOn;
  bool clearOnHide;
  String customDefaultValue;
  String calculateValue;
  bool calculateServer;
  bool allowCalculateOverride;
  String validateOn;
  ValidateEntity validate;
  bool unique;
  String errorLabel;
  String errors;
  String key;
  List<dynamic> tags;
  PropertiesEntity properties;
  ConditionalEntity conditional;
  String customConditional;
  List<dynamic> logic;
  PropertiesEntity attributes;
  OverlayEntity overlay;
  String type;
  bool input;
  String refreshOn;
  bool dataGridLabel;
  List<dynamic> addons;
  String inputType;
  String id;
  dynamic defaultValue;
  int rows;
  String editor;
  bool autoExpand;
  bool wysiwyg;
  bool fixedSize;
  bool delimiter;
  String decimalLimit;
  bool requireDecimal;
  String shortcut;
  String name;
  String value;
  String optionsLabelPosition;
  bool inline;
  List<ValuesEntity> values;
  String minSelectedCountMessage;
  String maxSelectedCountMessage;
  bool fieldSet;
  bool uniqueOptions;
  String dataSrc;
  DataEntity data;
  String dataType;
  String idPath;
  String valueProperty;
  int limit;
  String template;
  String refreshOnBlur;
  bool clearOnRefresh;
  bool searchEnabled;
  double selectThreshold;
  bool readOnlyValue;
  PropertiesEntity customOptions;
  bool useExactSearch;
  IndexeddbEntity indexeddb;
  String selectFields;
  String searchField;
  double searchDebounce;
  int minSearch;
  String filter;
  bool lazyLoad;
  bool authenticate;
  bool ignoreCache;
  FuseOptionsEntity fuseOptions;
  String footer;
  String width;
  String height;
  String backgroundColor;
  String penColor;
  String minWidth;
  String maxWidth;
  bool keepOverlayRatio;
  String delimeter;
  int maxTags;
  String storeas;
  String currency;
  String dataFormat;
  String format;
  String displayInTimezone;
  bool useLocaleSettings;
  bool allowInput;
  List<dynamic> shortcutButtons;
  bool enableDate;
  bool enableMinDateInput;
  DatePickerEntity datePicker;
  bool enableMaxDateInput;
  bool enableTime;
  TimePickerEntity timePicker;
  String defaultDate;
  String timezone;
  String datepickerMode;
  bool hideInputLabels;
  String inputsLabelPosition;
  FieldsEntity fields;
  bool dayFirst;
  String maxDate;
  String minDate;
  String maxYear;
  String minYear;
  KickboxEntity kickbox;
  String inputMode;
  String inputMaskPlaceholderChar;
  String storage;
  String dir;
  String fileNameTemplate;
  bool image;
  bool uploadOnly;
  bool webcam;
  List<FileTypesEntity> fileTypes;
  String filePattern;
  String fileMinSize;
  String fileMaxSize;
  String imageSize;
  bool privateDownload;
  List<ColumnsEntity> columns;
  bool autoAdjust;
  bool tree;
  List<ComponentEntity> components;
  bool verticalLayout;
  String legend;
  String title;
  String theme;
  bool collapsible;
  String breadcrumb;
  int numRows;
  int numCols;
  bool cloneRows;
  String cellAlignment;
  bool striped;
  bool bordered;
  bool hover;
  bool condensed;
  List<dynamic> header;
  String caption;
  String content;
  String selectValues;
  ComponentEntity({
    required this.label,
    required this.labelPosition,
    required this.labelWidth,
    required this.labelMargin,
    required this.placeholder,
    required this.description,
    required this.tooltip,
    required this.prefix,
    required this.suffix,
    required this.widget,
    required this.inputMask,
    required this.displayMask,
    required this.allowMultipleMasks,
    required this.customClass,
    required this.tabindex,
    required this.autocomplete,
    required this.hidden,
    required this.hideLabel,
    required this.showWordCount,
    required this.showCharCount,
    required this.mask,
    required this.autofocus,
    required this.spellcheck,
    required this.disabled,
    required this.tableView,
    required this.modalEdit,
    required this.multiple,
    required this.persistent,
    required this.inputFormat,
    required this.protected,
    required this.dbIndex,
    required this.casE,
    required this.truncateMultipleSpaces,
    required this.encrypted,
    required this.redrawOn,
    required this.clearOnHide,
    required this.customDefaultValue,
    required this.calculateValue,
    required this.calculateServer,
    required this.allowCalculateOverride,
    required this.validateOn,
    required this.validate,
    required this.unique,
    required this.errorLabel,
    required this.errors,
    required this.key,
    required this.tags,
    required this.properties,
    required this.conditional,
    required this.customConditional,
    required this.logic,
    required this.attributes,
    required this.overlay,
    required this.type,
    required this.input,
    required this.refreshOn,
    required this.dataGridLabel,
    required this.addons,
    required this.inputType,
    required this.id,
    required this.defaultValue,
    required this.rows,
    required this.editor,
    required this.autoExpand,
    required this.wysiwyg,
    required this.fixedSize,
    required this.delimiter,
    required this.decimalLimit,
    required this.requireDecimal,
    required this.shortcut,
    required this.name,
    required this.value,
    required this.optionsLabelPosition,
    required this.inline,
    required this.values,
    required this.minSelectedCountMessage,
    required this.maxSelectedCountMessage,
    required this.fieldSet,
    required this.uniqueOptions,
    required this.dataSrc,
    required this.data,
    required this.dataType,
    required this.idPath,
    required this.valueProperty,
    required this.limit,
    required this.template,
    required this.refreshOnBlur,
    required this.clearOnRefresh,
    required this.searchEnabled,
    required this.selectThreshold,
    required this.readOnlyValue,
    required this.customOptions,
    required this.useExactSearch,
    required this.indexeddb,
    required this.selectFields,
    required this.searchField,
    required this.searchDebounce,
    required this.minSearch,
    required this.filter,
    required this.lazyLoad,
    required this.authenticate,
    required this.ignoreCache,
    required this.fuseOptions,
    required this.footer,
    required this.width,
    required this.height,
    required this.backgroundColor,
    required this.penColor,
    required this.minWidth,
    required this.maxWidth,
    required this.keepOverlayRatio,
    required this.delimeter,
    required this.maxTags,
    required this.storeas,
    required this.currency,
    required this.dataFormat,
    required this.format,
    required this.displayInTimezone,
    required this.useLocaleSettings,
    required this.allowInput,
    required this.shortcutButtons,
    required this.enableDate,
    required this.enableMinDateInput,
    required this.datePicker,
    required this.enableMaxDateInput,
    required this.enableTime,
    required this.timePicker,
    required this.defaultDate,
    required this.timezone,
    required this.datepickerMode,
    required this.hideInputLabels,
    required this.inputsLabelPosition,
    required this.fields,
    required this.dayFirst,
    required this.maxDate,
    required this.minDate,
    required this.maxYear,
    required this.minYear,
    required this.kickbox,
    required this.inputMode,
    required this.inputMaskPlaceholderChar,
    required this.storage,
    required this.dir,
    required this.fileNameTemplate,
    required this.image,
    required this.uploadOnly,
    required this.webcam,
    required this.fileTypes,
    required this.filePattern,
    required this.fileMinSize,
    required this.fileMaxSize,
    required this.imageSize,
    required this.privateDownload,
    required this.columns,
    required this.autoAdjust,
    required this.tree,
    required this.components,
    required this.verticalLayout,
    required this.legend,
    required this.title,
    required this.theme,
    required this.collapsible,
    required this.breadcrumb,
    required this.numRows,
    required this.numCols,
    required this.cloneRows,
    required this.cellAlignment,
    required this.striped,
    required this.bordered,
    required this.hover,
    required this.condensed,
    required this.header,
    required this.caption,
    required this.content,
    required this.selectValues,
  });

  ComponentEntity copyWith({
    String? label,
    String? labelPosition,
    String? labelWidth,
    String? labelMargin,
    String? placeholder,
    String? description,
    String? tooltip,
    String? prefix,
    String? suffix,
    WidgetEntity? widget,
    String? inputMask,
    String? displayMask,
    bool? allowMultipleMasks,
    String? customClass,
    int? tabindex,
    String? autocomplete,
    bool? hidden,
    bool? hideLabel,
    bool? showWordCount,
    bool? showCharCount,
    bool? mask,
    bool? autofocus,
    bool? spellcheck,
    bool? disabled,
    bool? tableView,
    bool? modalEdit,
    bool? multiple,
    bool? persistent,
    String? inputFormat,
    bool? protected,
    bool? dbIndex,
    String? casE,
    bool? truncateMultipleSpaces,
    bool? encrypted,
    String? redrawOn,
    bool? clearOnHide,
    String? customDefaultValue,
    String? calculateValue,
    bool? calculateServer,
    bool? allowCalculateOverride,
    String? validateOn,
    ValidateEntity? validate,
    bool? unique,
    String? errorLabel,
    String? errors,
    String? key,
    List<dynamic>? tags,
    PropertiesEntity? properties,
    ConditionalEntity? conditional,
    String? customConditional,
    List<dynamic>? logic,
    PropertiesEntity? attributes,
    OverlayEntity? overlay,
    String? type,
    bool? input,
    String? refreshOn,
    bool? dataGridLabel,
    List<dynamic>? addons,
    String? inputType,
    String? id,
    dynamic defaultValue,
    int? rows,
    String? editor,
    bool? autoExpand,
    bool? wysiwyg,
    bool? fixedSize,
    bool? delimiter,
    String? decimalLimit,
    bool? requireDecimal,
    String? shortcut,
    String? name,
    String? value,
    String? optionsLabelPosition,
    bool? inline,
    List<ValuesEntity>? values,
    String? minSelectedCountMessage,
    String? maxSelectedCountMessage,
    bool? fieldSet,
    bool? uniqueOptions,
    String? dataSrc,
    DataEntity? data,
    String? dataType,
    String? idPath,
    String? valueProperty,
    int? limit,
    String? template,
    String? refreshOnBlur,
    bool? clearOnRefresh,
    bool? searchEnabled,
    double? selectThreshold,
    bool? readOnlyValue,
    PropertiesEntity? customOptions,
    bool? useExactSearch,
    IndexeddbEntity? indexeddb,
    String? selectFields,
    String? searchField,
    double? searchDebounce,
    int? minSearch,
    String? filter,
    bool? lazyLoad,
    bool? authenticate,
    bool? ignoreCache,
    FuseOptionsEntity? fuseOptions,
    String? footer,
    String? width,
    String? height,
    String? backgroundColor,
    String? penColor,
    String? minWidth,
    String? maxWidth,
    bool? keepOverlayRatio,
    String? delimeter,
    int? maxTags,
    String? storeas,
    String? currency,
    String? dataFormat,
    String? format,
    String? displayInTimezone,
    bool? useLocaleSettings,
    bool? allowInput,
    List<dynamic>? shortcutButtons,
    bool? enableDate,
    bool? enableMinDateInput,
    DatePickerEntity? datePicker,
    bool? enableMaxDateInput,
    bool? enableTime,
    TimePickerEntity? timePicker,
    String? defaultDate,
    String? timezone,
    String? datepickerMode,
    bool? hideInputLabels,
    String? inputsLabelPosition,
    FieldsEntity? fields,
    bool? dayFirst,
    String? maxDate,
    String? minDate,
    String? maxYear,
    String? minYear,
    KickboxEntity? kickbox,
    String? inputMode,
    String? inputMaskPlaceholderChar,
    String? storage,
    String? dir,
    String? fileNameTemplate,
    bool? image,
    bool? uploadOnly,
    bool? webcam,
    List<FileTypesEntity>? fileTypes,
    String? filePattern,
    String? fileMinSize,
    String? fileMaxSize,
    String? imageSize,
    bool? privateDownload,
    List<ColumnsEntity>? columns,
    bool? autoAdjust,
    bool? tree,
    List<ComponentEntity>? components,
    bool? verticalLayout,
    String? legend,
    String? title,
    String? theme,
    bool? collapsible,
    String? breadcrumb,
    int? numRows,
    int? numCols,
    bool? cloneRows,
    String? cellAlignment,
    bool? striped,
    bool? bordered,
    bool? hover,
    bool? condensed,
    List<dynamic>? header,
    String? caption,
    String? content,
    String? selectValues,
  }) {
    return ComponentEntity(
      label: label ?? this.label,
      labelPosition: labelPosition ?? this.labelPosition,
      labelWidth: labelWidth ?? this.labelWidth,
      labelMargin: labelMargin ?? this.labelMargin,
      placeholder: placeholder ?? this.placeholder,
      description: description ?? this.description,
      tooltip: tooltip ?? this.tooltip,
      prefix: prefix ?? this.prefix,
      suffix: suffix ?? this.suffix,
      widget: widget ?? this.widget,
      inputMask: inputMask ?? this.inputMask,
      displayMask: displayMask ?? this.displayMask,
      allowMultipleMasks: allowMultipleMasks ?? this.allowMultipleMasks,
      customClass: customClass ?? this.customClass,
      tabindex: tabindex ?? this.tabindex,
      autocomplete: autocomplete ?? this.autocomplete,
      hidden: hidden ?? this.hidden,
      hideLabel: hideLabel ?? this.hideLabel,
      showWordCount: showWordCount ?? this.showWordCount,
      showCharCount: showCharCount ?? this.showCharCount,
      mask: mask ?? this.mask,
      autofocus: autofocus ?? this.autofocus,
      spellcheck: spellcheck ?? this.spellcheck,
      disabled: disabled ?? this.disabled,
      tableView: tableView ?? this.tableView,
      modalEdit: modalEdit ?? this.modalEdit,
      multiple: multiple ?? this.multiple,
      persistent: persistent ?? this.persistent,
      inputFormat: inputFormat ?? this.inputFormat,
      protected: protected ?? this.protected,
      dbIndex: dbIndex ?? this.dbIndex,
      casE: casE ?? this.casE,
      truncateMultipleSpaces:
          truncateMultipleSpaces ?? this.truncateMultipleSpaces,
      encrypted: encrypted ?? this.encrypted,
      redrawOn: redrawOn ?? this.redrawOn,
      clearOnHide: clearOnHide ?? this.clearOnHide,
      customDefaultValue: customDefaultValue ?? this.customDefaultValue,
      calculateValue: calculateValue ?? this.calculateValue,
      calculateServer: calculateServer ?? this.calculateServer,
      allowCalculateOverride:
          allowCalculateOverride ?? this.allowCalculateOverride,
      validateOn: validateOn ?? this.validateOn,
      validate: validate ?? this.validate,
      unique: unique ?? this.unique,
      errorLabel: errorLabel ?? this.errorLabel,
      errors: errors ?? this.errors,
      key: key ?? this.key,
      tags: tags ?? this.tags,
      properties: properties ?? this.properties,
      conditional: conditional ?? this.conditional,
      customConditional: customConditional ?? this.customConditional,
      logic: logic ?? this.logic,
      attributes: attributes ?? this.attributes,
      overlay: overlay ?? this.overlay,
      type: type ?? this.type,
      input: input ?? this.input,
      refreshOn: refreshOn ?? this.refreshOn,
      dataGridLabel: dataGridLabel ?? this.dataGridLabel,
      addons: addons ?? this.addons,
      inputType: inputType ?? this.inputType,
      id: id ?? this.id,
      defaultValue: defaultValue ?? this.defaultValue,
      rows: rows ?? this.rows,
      editor: editor ?? this.editor,
      autoExpand: autoExpand ?? this.autoExpand,
      wysiwyg: wysiwyg ?? this.wysiwyg,
      fixedSize: fixedSize ?? this.fixedSize,
      delimiter: delimiter ?? this.delimiter,
      decimalLimit: decimalLimit ?? this.decimalLimit,
      requireDecimal: requireDecimal ?? this.requireDecimal,
      shortcut: shortcut ?? this.shortcut,
      name: name ?? this.name,
      value: value ?? this.value,
      optionsLabelPosition: optionsLabelPosition ?? this.optionsLabelPosition,
      inline: inline ?? this.inline,
      values: values ?? this.values,
      minSelectedCountMessage:
          minSelectedCountMessage ?? this.minSelectedCountMessage,
      maxSelectedCountMessage:
          maxSelectedCountMessage ?? this.maxSelectedCountMessage,
      fieldSet: fieldSet ?? this.fieldSet,
      uniqueOptions: uniqueOptions ?? this.uniqueOptions,
      dataSrc: dataSrc ?? this.dataSrc,
      data: data ?? this.data,
      dataType: dataType ?? this.dataType,
      idPath: idPath ?? this.idPath,
      valueProperty: valueProperty ?? this.valueProperty,
      limit: limit ?? this.limit,
      template: template ?? this.template,
      refreshOnBlur: refreshOnBlur ?? this.refreshOnBlur,
      clearOnRefresh: clearOnRefresh ?? this.clearOnRefresh,
      searchEnabled: searchEnabled ?? this.searchEnabled,
      selectThreshold: selectThreshold ?? this.selectThreshold,
      readOnlyValue: readOnlyValue ?? this.readOnlyValue,
      customOptions: customOptions ?? this.customOptions,
      useExactSearch: useExactSearch ?? this.useExactSearch,
      indexeddb: indexeddb ?? this.indexeddb,
      selectFields: selectFields ?? this.selectFields,
      searchField: searchField ?? this.searchField,
      searchDebounce: searchDebounce ?? this.searchDebounce,
      minSearch: minSearch ?? this.minSearch,
      filter: filter ?? this.filter,
      lazyLoad: lazyLoad ?? this.lazyLoad,
      authenticate: authenticate ?? this.authenticate,
      ignoreCache: ignoreCache ?? this.ignoreCache,
      fuseOptions: fuseOptions ?? this.fuseOptions,
      footer: footer ?? this.footer,
      width: width ?? this.width,
      height: height ?? this.height,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      penColor: penColor ?? this.penColor,
      minWidth: minWidth ?? this.minWidth,
      maxWidth: maxWidth ?? this.maxWidth,
      keepOverlayRatio: keepOverlayRatio ?? this.keepOverlayRatio,
      delimeter: delimeter ?? this.delimeter,
      maxTags: maxTags ?? this.maxTags,
      storeas: storeas ?? this.storeas,
      currency: currency ?? this.currency,
      dataFormat: dataFormat ?? this.dataFormat,
      format: format ?? this.format,
      displayInTimezone: displayInTimezone ?? this.displayInTimezone,
      useLocaleSettings: useLocaleSettings ?? this.useLocaleSettings,
      allowInput: allowInput ?? this.allowInput,
      shortcutButtons: shortcutButtons ?? this.shortcutButtons,
      enableDate: enableDate ?? this.enableDate,
      enableMinDateInput: enableMinDateInput ?? this.enableMinDateInput,
      datePicker: datePicker ?? this.datePicker,
      enableMaxDateInput: enableMaxDateInput ?? this.enableMaxDateInput,
      enableTime: enableTime ?? this.enableTime,
      timePicker: timePicker ?? this.timePicker,
      defaultDate: defaultDate ?? this.defaultDate,
      timezone: timezone ?? this.timezone,
      datepickerMode: datepickerMode ?? this.datepickerMode,
      hideInputLabels: hideInputLabels ?? this.hideInputLabels,
      inputsLabelPosition: inputsLabelPosition ?? this.inputsLabelPosition,
      fields: fields ?? this.fields,
      dayFirst: dayFirst ?? this.dayFirst,
      maxDate: maxDate ?? this.maxDate,
      minDate: minDate ?? this.minDate,
      maxYear: maxYear ?? this.maxYear,
      minYear: minYear ?? this.minYear,
      kickbox: kickbox ?? this.kickbox,
      inputMode: inputMode ?? this.inputMode,
      inputMaskPlaceholderChar:
          inputMaskPlaceholderChar ?? this.inputMaskPlaceholderChar,
      storage: storage ?? this.storage,
      dir: dir ?? this.dir,
      fileNameTemplate: fileNameTemplate ?? this.fileNameTemplate,
      image: image ?? this.image,
      uploadOnly: uploadOnly ?? this.uploadOnly,
      webcam: webcam ?? this.webcam,
      fileTypes: fileTypes ?? this.fileTypes,
      filePattern: filePattern ?? this.filePattern,
      fileMinSize: fileMinSize ?? this.fileMinSize,
      fileMaxSize: fileMaxSize ?? this.fileMaxSize,
      imageSize: imageSize ?? this.imageSize,
      privateDownload: privateDownload ?? this.privateDownload,
      columns: columns ?? this.columns,
      autoAdjust: autoAdjust ?? this.autoAdjust,
      tree: tree ?? this.tree,
      components: components ?? this.components,
      verticalLayout: verticalLayout ?? this.verticalLayout,
      legend: legend ?? this.legend,
      title: title ?? this.title,
      theme: theme ?? this.theme,
      collapsible: collapsible ?? this.collapsible,
      breadcrumb: breadcrumb ?? this.breadcrumb,
      numRows: numRows ?? this.numRows,
      numCols: numCols ?? this.numCols,
      cloneRows: cloneRows ?? this.cloneRows,
      cellAlignment: cellAlignment ?? this.cellAlignment,
      striped: striped ?? this.striped,
      bordered: bordered ?? this.bordered,
      hover: hover ?? this.hover,
      condensed: condensed ?? this.condensed,
      header: header ?? this.header,
      caption: caption ?? this.caption,
      content: content ?? this.content,
      selectValues: selectValues ?? this.selectValues,
    );
  }
}
