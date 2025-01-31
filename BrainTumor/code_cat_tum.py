import pandas as pd

df = pd.read_clipboard()

df

def convertir_a_factor(df, columnas_categoricas):
    diccionario_niveles = {}
    
    for col in columnas_categoricas:
        df[col] = df[col].astype('category')  # Convertir a categoría
        diccionario_niveles[col] = dict(enumerate(df[col].cat.categories))  # Guardar niveles
        
        df[col] = df[col].cat.codes  # Convertir a valores numéricos
    
    return df, diccionario_niveles





cat_vars = ['Gender', 'Country', 'Tumor_Location',
       'MRI_Findings', 'Smoking_History',
       'Alcohol_Consumption', 'Radiation_Exposure', 'Head_Injury_History',
       'Chronic_Illness', 'Diabetes', 'Tumor_Type',
       'Treatment_Received', 'Tumor_Growth_Rate',
       'Family_History', 'Symptom_Severity', 'Brain_Tumor_Present']


df_transformado, niveles = convertir_a_factor(df, cat_vars)

print(df_transformado)
print("\nDiccionario de niveles:")
print(niveles)

df_transformado.to_csv("brain_tumor.csv")
niveles
