//
// Copyright 2017 niji
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import Foundation
import JSONCodable

extension User {
  init(object: JSONObject) throws {
    let decoder = JSONDecoder(object: object)
    self.identifier = try decoder.decode(JSONKeys.identifier.rawValue)
    self.firstName = try decoder.decode(JSONKeys.firstName.rawValue)
    self.lastName = try decoder.decode(JSONKeys.lastName.rawValue)
    self.age = try decoder.decode(JSONKeys.age.rawValue)
  }
  
  func toJSON() throws -> JSONObject {
    return try JSONEncoder.create({ (encoder: JSONEncoder) in
      try encoder.encode(self.identifier, key: JSONKeys.identifier.rawValue)
      try encoder.encode(self.firstName, key: JSONKeys.firstName.rawValue)
      try encoder.encode(self.lastName, key: JSONKeys.lastName.rawValue)
      try encoder.encode(self.age, key: JSONKeys.age.rawValue)
    })
  }
}
