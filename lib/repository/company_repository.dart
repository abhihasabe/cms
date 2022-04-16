import 'package:cms/models/add_comapny_req.dart';
import 'package:cms/models/employee_resp_model.dart';
import 'package:cms/theme/app_network_constants.dart';
import 'package:cms/network/api_calls.dart';

class CompanyRepository {
  dynamic resp;

  Future fetchCompanyData(token) async {
    resp = APIManager.getAPICall(SHOW_COMPANY_URL, token);
    return resp;
  }

  Future fetchCompanyTypeData(token) async {
    resp = APIManager.getAPICall(COMPANY_TYPE_URL, token);
    return resp;
  }

  Future fetchCountyData(token) async {
    resp = APIManager.getAPICall(COUNTRY_URL, token);
    return resp;
  }

  Future fetchCityData(token, int i) async {
    resp = APIManager.getAPICall(CITY_URL + "$i", token);
    return resp;
  }

  Future addCompany(AddCompantReq addCompanyReq, token) async {
    var addCompanyInputJson = {
      "company_name": addCompanyReq.companyName,
      "company_type": addCompanyReq.companyType,
      "company_email": addCompanyReq.companyEmail,
      "company_phone": addCompanyReq.companyPhone,
      "company_fax": addCompanyReq.companyFax,
      "company_address": addCompanyReq.companyAddress,
      "company_pincode": addCompanyReq.companyPincode,
      "company_country": addCompanyReq.companyCountry,
      "company_branch": addCompanyReq.companyBranch,
      "company_website": addCompanyReq.companyWebsite,
      "company_info": addCompanyReq.companyInfo
    };
    resp = APIManager.postAPICall(ADD_COMPANY_URL, addCompanyInputJson, token);
    return resp;
  }
}
